require 'rails_helper'

RSpec.describe ApplicationAudit, type: :model do
  it { expect(described_class).to respond_to(:clear_store) }
  it { expect(Audited.audit_class).to eq described_class }
  let(:store_keys) { [:audited_user, :current_request_uuid, :current_remote_address] }
  after(:each) do
    described_class.clear_store
    expect(Audited.store.keys).not_to include *store_keys
  end

  it { expect{subject.save}.not_to raise_error }

  let(:current_user) { FactoryBot.create(:user, :save_without_auditing) }
  let(:current_agent) { FactoryBot.create(:software_agent, :save_without_auditing) }
  let(:current_user_with_agent) { FactoryBot.create(:user, :save_without_auditing, current_software_agent: current_agent) }
  let(:request_uuid) { SecureRandom.uuid }
  let(:remote_address) { Faker::Internet.ip_v4_address }
  let(:comment) { {
    endpoint: Faker::Internet.url,
    action: 'GET'
  } }
  let(:expected_comment) { comment.stringify_keys }

  describe '.current_user=' do
    it { expect(described_class).to respond_to(:current_user=).with(1).argument }
    it { expect(subject.user).to be_nil }

    context 'when called' do
      before(:each) do
        expect{ described_class.current_user = current_user }.not_to raise_error
      end
      it { expect(subject.user).to be_nil }

      context 'after subject#save' do
        before(:each) { expect(subject.save).to be_truthy }
        it { expect(subject.user).to eq current_user }
        it { expect(subject.comment).to be_a Hash }
        it { expect(subject.comment).not_to include('software_agent_id') }
      end
    end

    context 'when called with user.current_software_agent set' do
      before(:each) do
        expect{ described_class.current_user = current_user_with_agent }.not_to raise_error
      end
      it { expect(subject.user).to be_nil }

      context 'after subject#save' do
        before(:each) { expect(subject.save).to be_truthy }
        it { expect(subject.user).to eq current_user_with_agent }
        it { expect(subject.comment).to be_a Hash }
        it { expect(subject.comment).to include('software_agent_id' => current_agent.id) }
      end
    end
  end

  describe '.current_user' do
    it { expect(described_class).to respond_to(:current_user) }
    it { expect(described_class.current_user).to be_nil }

    context 'after .current_user= called' do
      before(:each) do
        expect{ described_class.current_user = current_user }.not_to raise_error
      end
      it { expect(described_class.current_user).to eq current_user }
    end
  end

  describe '.current_request_uuid=' do
    it { expect(described_class).to respond_to(:current_request_uuid=).with(1).argument }
    it { expect(subject.request_uuid).to be_nil }

    context 'when called' do
      before(:each) do
        expect{ described_class.current_request_uuid = request_uuid }.not_to raise_error
      end
      it { expect(subject.request_uuid).to be_nil }

      context 'after subject#save' do
        before(:each) do
          expect(described_class).not_to receive(:current_request_uuid=)
          expect(subject.save).to be_truthy
        end
        it { expect(subject.request_uuid).to eq request_uuid }
      end
    end
  end

  describe '.current_request_uuid' do
    it { expect(described_class).to respond_to(:current_request_uuid) }
    it { expect(described_class.current_request_uuid).to be_nil }

    context 'after .current_request_uuid= called' do
      before(:each) do
        expect{ described_class.current_request_uuid = request_uuid }.not_to raise_error
      end
      it { expect(described_class.current_request_uuid).to eq request_uuid }
    end
  end

  describe '.generate_current_request_uuid' do
    it { expect(described_class).to respond_to(:generate_current_request_uuid) }
    it { expect(described_class.generate_current_request_uuid).to match /\A\h{8}-\h{4}-\h{4}-\h{4}-\h{12}\z/ }
    it { expect(described_class.current_request_uuid).to be_nil }
    it { expect(subject.request_uuid).to be_nil }
    context 'when called' do
      let(:call_method) { described_class.generate_current_request_uuid }
      before(:each) { expect{ call_method }.not_to raise_error }
      it { expect(described_class.current_request_uuid).to eq call_method }
      it { expect(subject.request_uuid).to be_nil }
      it 'is idempotent' do
        expect(described_class.generate_current_request_uuid).to eq call_method
      end
    end

    context 'after subject#save' do
      before(:each) do
        expect(described_class).to receive(:generate_current_request_uuid).and_call_original
        expect(subject.save).to be_truthy
      end
      it { expect(described_class.current_request_uuid).not_to be_nil }
      it { expect(subject.request_uuid).not_to be_nil }
      it { expect(subject.request_uuid).to eq described_class.current_request_uuid }
    end
  end

  describe '.current_remote_address=' do
    it { expect(described_class).to respond_to(:current_remote_address=).with(1).argument }
    it { expect(subject.remote_address).to be_nil }

    context 'when called' do
      before(:each) do
        expect{ described_class.current_remote_address = remote_address }.not_to raise_error
      end
      it { expect(subject.remote_address).to be_nil }

      context 'after subject#save' do
        before(:each) { expect(subject.save).to be_truthy }
        it { expect(subject.remote_address).to eq remote_address }
      end
    end
  end

  describe '.current_remote_address' do
    it { expect(described_class).to respond_to(:current_remote_address) }
    it { expect(described_class.current_remote_address).to be_nil }

    context 'after .current_remote_address= called' do
      before(:each) do
        expect{ described_class.current_remote_address = remote_address }.not_to raise_error
      end
      it { expect(described_class.current_remote_address).to eq remote_address }
    end
  end

  describe '.current_comment=' do
    it { expect(described_class).to respond_to(:current_comment=).with(1).argument }
    it { expect(subject.comment).to be_nil }

    context 'when called' do
      before(:each) do
        expect{ described_class.current_comment = comment }.not_to raise_error
      end
      it { expect(subject.comment).to be_nil }

      context 'after subject#save' do
        before(:each) { expect(subject.save).to be_truthy }
        it { expect(subject.comment).not_to eq comment }
        it { expect(subject.comment).to eq expected_comment }
      end

      context 'with subject.comment set' do
        before(:each) { subject.comment = subject_comment }
        let(:subject_comment) { {'foo' => 'bar'} }
        let(:expected_comment) { subject_comment.merge(comment).stringify_keys }
        it { expect(subject.comment).to eq subject_comment }

        context 'after subject#save' do
          before(:each) { expect(subject.save).to be_truthy }
          it { expect(subject.comment).to eq expected_comment }
        end
      end
    end
  end

  describe '.current_comment' do
    it { expect(described_class).to respond_to(:current_comment) }
    it { expect(described_class.current_comment).to be_nil }

    context 'after .current_comment= called' do
      before(:each) do
        expect{ described_class.current_comment = comment }.not_to raise_error
      end
      it { expect(described_class.current_comment).to eq comment }
    end
  end

  describe '.set_current_env_from_request_uuid' do
    it { expect(described_class).to respond_to(:set_current_env_from_request_uuid).with(1).argument }
    context 'with existing audit' do
      let(:last_audit) { described_class.new }
      before(:each) do
        described_class.current_request_uuid = request_uuid
        described_class.current_user = current_user
        described_class.current_remote_address = remote_address
        described_class.current_comment = comment
        expect(last_audit.save).to be_truthy
        described_class.clear_store
      end
      it { expect(last_audit.user).to eq current_user }
      it { expect(last_audit.request_uuid).to eq request_uuid }
      it { expect(last_audit.remote_address).to eq remote_address }
      it { expect(last_audit.comment).to eq expected_comment }
      it { expect(described_class.current_user).to be_nil }
      it { expect(described_class.current_request_uuid).to be_nil }
      it { expect(described_class.current_remote_address).to be_nil }
      it { expect(described_class.current_comment).to be_nil }

      context 'when called with request_uuid' do
        before(:each) do
          expect{ described_class.set_current_env_from_request_uuid(request_uuid) }.not_to raise_error
        end
        it { expect(described_class.current_user).to eq current_user }
        it { expect(described_class.current_request_uuid).to eq request_uuid }
        it { expect(described_class.current_remote_address).to eq remote_address }
        it { expect(described_class.current_comment).to eq expected_comment }
      end

      context 'when called with nonexistent request_uuid' do
        let(:nonexistent_request_uuid) { SecureRandom.uuid }
        before(:each) do
          expect{ described_class.set_current_env_from_request_uuid(nonexistent_request_uuid) }.not_to raise_error
        end
        it { expect(described_class.current_request_uuid).to eq nonexistent_request_uuid }
        it { expect(described_class.current_user).to be_nil }
        it { expect(described_class.current_remote_address).to be_nil }
        it { expect(described_class.current_comment).to be_nil }
      end

      context 'when audit env is populated and called with nonexistent request_uuid' do
        let(:nonexistent_request_uuid) { SecureRandom.uuid }
        before(:each) do
          described_class.current_request_uuid = SecureRandom.uuid
          described_class.current_user = FactoryBot.create(:user, :save_without_auditing)
          described_class.current_remote_address = Faker::Internet.ip_v4_address
          described_class.current_comment = {foo: 'bar'}
          expect{ described_class.set_current_env_from_request_uuid(nonexistent_request_uuid) }.not_to raise_error
        end
        # current audit env values are reset to nil when a nonexistent
        # request_uuid is passed to set_current_env_from_request_uuid
        it { expect(described_class.current_request_uuid).to eq nonexistent_request_uuid }
        it { expect(described_class.current_user).to be_nil }
        it { expect(described_class.current_remote_address).to be_nil }
        it { expect(described_class.current_comment).to be_nil }
      end
    end
  end
end
