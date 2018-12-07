require 'rails_helper'

RSpec.describe S3StorageProvider, type: :model do
  include ActiveSupport::Testing::TimeHelpers
  subject { FactoryBot.build(:s3_storage_provider) }
  let(:project) { stub_model(Project, id: SecureRandom.uuid) }
  let(:upload) { FactoryBot.create(:upload, :skip_validation) }
  let(:chunk) { FactoryBot.create(:chunk, :skip_validation, upload: upload) }
  let(:domain) { Faker::Internet.domain_name }

  shared_context 'stubbed subject#client' do
    let(:stubbed_client) {
      Aws::S3::Client.new(stub_responses: true)
    }
    before { allow(subject).to receive(:client).and_return(stubbed_client) }
  end

  it_behaves_like 'A StorageProvider implementation'

  # Validations
  it { is_expected.to validate_presence_of :url_root }
  it { is_expected.to allow_value("http://#{domain}").for(:url_root) }
  it { is_expected.to allow_value("https://#{domain}").for(:url_root) }
  it { is_expected.not_to allow_value(domain).for(:url_root) }
  it { is_expected.to validate_presence_of :service_user }
  it { is_expected.to validate_presence_of :service_pass }

  describe '#configure' do
    it { expect(subject.configure).to eq true }
  end

  describe '#initialize_project' do
    let(:bucket_location) { "/#{project.id}" }
    it 'should create a bucket with the project id' do
      is_expected.to receive(:create_bucket)
        .with(project.id)
        .and_return({ location: bucket_location })
      expect(subject.initialize_project(project)).to eq(bucket_location)
    end
  end

  describe '#is_initialized?(project)' do
    before(:example) do
      is_expected.to receive(:head_bucket)
        .with(project.id)
        .and_return(head_bucket_response)
    end
    context 'project container exists' do
      let(:head_bucket_response) { {} }
      it { expect(subject.is_initialized?(project)).to be_truthy }
    end

    context 'project container does not exist' do
      let(:head_bucket_response) { false }
      it { expect(subject.is_initialized?(project)).to be_falsey }
    end
  end

  # S3 Interface
  it { is_expected.to respond_to(:client).with(0).arguments }
  describe '#client' do
    let(:uri_parsed_url_root) { URI.parse(subject.url_root) }
    it { expect(subject.client).to be_a Aws::S3::Client }
    it { expect(subject.client.config.region).to eq 'us-east-1' }
    it { expect(subject.client.config.force_path_style).to eq true }
    it { expect(subject.client.config.access_key_id).to eq subject.service_user }
    it { expect(subject.client.config.secret_access_key).to eq subject.service_pass }
    it { expect(subject.client.config.endpoint).to eq uri_parsed_url_root }
    it 'reuses the same client object' do
      expect(subject.client).to eq(subject.client)
    end
  end

  it { is_expected.to respond_to(:list_buckets).with(0).arguments }
  describe '#list_buckets' do
    include_context 'stubbed subject#client'

    it { expect(subject.list_buckets).to eq([]) }

    context 'with buckets' do
      let(:bucket_array) { [{ name: SecureRandom.uuid }] }
      before(:example) do
        subject.client.stub_responses(:list_buckets, { buckets: bucket_array })
      end
      it { expect(subject.list_buckets).to eq(bucket_array) }
    end
  end

  it { is_expected.not_to respond_to(:create_bucket).with(0).arguments }
  it { is_expected.to respond_to(:create_bucket).with(1).argument }
  describe '#create_bucket' do
    include_context 'stubbed subject#client'
    let(:bucket_name) { SecureRandom.uuid }
    let(:expected_response) { { location: "/#{bucket_name}" } }
    before(:example) do
      subject.client.stub_responses(:create_bucket, expected_response)
    end
    after(:example) do
      expect(subject.client.api_requests.first).not_to be_nil
      expect(subject.client.api_requests.first[:params][:bucket]).to eq(bucket_name)
    end
    it { expect(subject.create_bucket(bucket_name)).to eq(expected_response) }
  end

  it { is_expected.not_to respond_to(:head_bucket).with(0).arguments }
  it { is_expected.to respond_to(:head_bucket).with(1).argument }
  describe '#head_bucket' do
    include_context 'stubbed subject#client'
    let(:bucket_name) { SecureRandom.uuid }
    let(:expected_response) { {} }
    before(:example) do
      subject.client.stub_responses(:head_bucket, expected_response)
    end
    after(:example) do
      expect(subject.client.api_requests.first).not_to be_nil
      expect(subject.client.api_requests.first[:params][:bucket]).to eq(bucket_name)
    end
    it { expect(subject.head_bucket(bucket_name)).to eq(expected_response) }

    context 'when bucket does not exist' do
      let(:expected_response) { 'NoSuchBucket' }
      it 'rescues from NoSuchBucket exception and returns false' do
        expect {
          expect(subject.head_bucket(bucket_name)).to be_falsey
        }.not_to raise_error
      end
    end
  end

  it { is_expected.not_to respond_to(:create_multipart_upload).with(0..1).arguments }
  it { is_expected.to respond_to(:create_multipart_upload).with(2).arguments }
  describe '#create_multipart_upload' do
    include_context 'stubbed subject#client'
    let(:bucket_name) { SecureRandom.uuid }
    let(:object_key) { SecureRandom.uuid }
    let(:expected_upload_id) { Faker::Lorem.characters(88) }
    let(:expected_response) { {
      bucket: bucket_name,
      key: object_key,
      upload_id: expected_upload_id
    } }
    before(:example) do
      subject.client.stub_responses(:create_multipart_upload, expected_response)
    end
    after(:example) do
      expect(subject.client.api_requests.first).not_to be_nil
      expect(subject.client.api_requests.first[:params][:bucket]).to eq(bucket_name)
      expect(subject.client.api_requests.first[:params][:key]).to eq(object_key)
    end
    it { expect(subject.create_multipart_upload(bucket_name, object_key)).to eq(expected_upload_id) }
  end

  it { is_expected.not_to respond_to(:complete_multipart_upload).with(0..1).arguments }
  it { is_expected.not_to respond_to(:complete_multipart_upload).with(2).arguments }
  it { is_expected.to respond_to(:complete_multipart_upload).with(2).arguments.and_keywords(:upload_id, :parts) }
  describe '#complete_multipart_upload' do
    include_context 'stubbed subject#client'
    let(:bucket_name) { SecureRandom.uuid }
    let(:object_key) { SecureRandom.uuid }
    let(:multipart_upload_id) { Faker::Lorem.characters(88) }
    let(:parts) { [
      { etag: "\"#{Faker::Crypto.md5}\"", part_number: 1 },
      { etag: "\"#{Faker::Crypto.md5}\"", part_number: 2 }
    ] }
    let(:expected_response) { {
      bucket: bucket_name,
      etag: "\"#{Faker::Crypto.md5}\"",
      key: object_key,
      location: "/#{bucket_name}"
    } }
    before(:example) do
      subject.client.stub_responses(:complete_multipart_upload, expected_response)
    end
    after(:example) do
      expect(subject.client.api_requests.first).not_to be_nil
      expect(subject.client.api_requests.first[:params][:bucket]).to eq(bucket_name)
      expect(subject.client.api_requests.first[:params][:key]).to eq(object_key)
      expect(subject.client.api_requests.first[:params][:upload_id]).to eq(multipart_upload_id)
      expect(subject.client.api_requests.first[:params][:multipart_upload]).to eq({parts: parts})
    end
    it { expect(subject.complete_multipart_upload(bucket_name, object_key, upload_id: multipart_upload_id, parts: parts)).to eq(expected_response) }
  end

  it { is_expected.not_to respond_to(:presigned_url).with(0).arguments }
  it { is_expected.not_to respond_to(:presigned_url).with(1).argument }
  it { is_expected.to respond_to(:presigned_url).with(1).argument.and_keywords(:bucket_name, :object_key) }
  it { is_expected.to respond_to(:presigned_url).with(1).argument.and_keywords(:bucket_name, :object_key, :upload_id, :part_number, :content_length) }
  describe '#presigned_url' do
    around(:example) do |example|
      travel_to(Time.now) do #freeze_time
        example.run
      end
    end
    let(:signer) { Aws::S3::Presigner.new(client: subject.client) }
    let(:bucket_name) { SecureRandom.uuid }
    let(:object_key) { SecureRandom.uuid }

    context 'sign :get_object' do
      let(:expected_url) {
        signer.presigned_url(
          :get_object,
          bucket: bucket_name,
          key: object_key,
          expires_in: subject.signed_url_duration
        )
      }
      it { expect(subject.presigned_url(:get_object, bucket_name: bucket_name, object_key: object_key)).to eq expected_url }
    end

    context 'sign :upload_part' do
      let(:multipart_upload_id) { Faker::Lorem.characters(88) }
      let(:part_number) { Faker::Number.between(1, 100) }
      let(:part_size) { Faker::Number.between(1000, 10000) }
      let(:expected_url) {
        signer.presigned_url(
          :upload_part,
          bucket: bucket_name,
          key: object_key,
          upload_id: multipart_upload_id,
          part_number: part_number,
          content_length: part_size,
          expires_in: subject.signed_url_duration
        )
      }
      it { expect(subject.presigned_url(:upload_part, bucket_name: bucket_name, object_key: object_key, upload_id: multipart_upload_id, part_number: part_number, content_length: part_size)).to eq expected_url }
    end
  end
end
