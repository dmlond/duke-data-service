require 'rails_helper'

RSpec.describe MetaProperty, type: :model do
  let(:templatable) { FactoryBot.create(:data_file) }
  let(:meta_template) { FactoryBot.create(:meta_template, templatable: templatable) }
  let(:property) { FactoryBot.create(:property, data_type: data_type, template: meta_template.template) }
  let(:data_type) { 'string' }
  let(:other_property) { FactoryBot.create(:property) }

  it_behaves_like 'an audited model'

  describe 'associations' do
    it { is_expected.to belong_to(:meta_template).touch(true) }
    it { is_expected.to belong_to(:property) }
  end

  describe 'instance methods' do
    it { is_expected.to delegate_method(:data_type).to(:property) }
    it { is_expected.to respond_to(:key) }
    it { is_expected.to respond_to(:key=).with(1).argument }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:set_property_from_key).before(:validation) }
  end

  describe 'validations' do
    include_context 'elasticsearch prep', [
        :meta_template,
        :property,
        :existing_meta_property_for_uniqueness_validation
      ],
      [:templatable]
    let(:existing_meta_property_for_uniqueness_validation) { FactoryBot.create(:meta_property, meta_template: meta_template) }

    it { is_expected.to validate_presence_of(:meta_template) }
    it { is_expected.to validate_presence_of(:property) }
    it { is_expected.to validate_presence_of(:value) }

    it { is_expected.to validate_uniqueness_of(:property).scoped_to(:meta_template_id).case_insensitive }

    context 'when a meta_template is set' do
      subject { FactoryBot.build(:meta_property, meta_template: meta_template) }

      it { is_expected.to allow_value(nil).for(:key) }
      it { is_expected.to allow_value(property.key).for(:key) }
      it { is_expected.not_to allow_value(other_property.key).for(:key) }
    end

    context 'when a meta_template is nil' do
      subject { FactoryBot.build(:meta_property, meta_template: nil) }

      it { is_expected.to allow_value(nil).for(:key) }
      it { is_expected.not_to allow_value(property.key).for(:key) }
      it { is_expected.not_to allow_value(other_property.key).for(:key) }
    end

    context 'with property set' do
      subject { FactoryBot.build(:meta_property, meta_template: meta_template, property: property) }
      context 'when data_type is string' do
        let(:data_type) { 'string' }
        it { is_expected.not_to validate_numericality_of(:value) }
      end
      context 'when data_type is long' do
        let(:data_type) { 'long' }
        it { is_expected.to validate_numericality_of(:value) }
      end
      context 'when data_type is integer' do
        let(:data_type) { 'integer' }
        it { is_expected.to validate_numericality_of(:value) }
      end
      context 'when data_type is short' do
        let(:data_type) { 'short' }
        it { is_expected.to validate_numericality_of(:value) }
      end
      context 'when data_type is byte' do
        let(:data_type) { 'byte' }
        it { is_expected.to validate_numericality_of(:value) }
      end
      context 'when data_type is double' do
        let(:data_type) { 'double' }
        it { is_expected.to validate_numericality_of(:value) }
      end
      context 'when data_type is float' do
        let(:data_type) { 'float' }
        it { is_expected.to validate_numericality_of(:value) }
      end
      context 'when data_type is date' do
        let(:data_type) { 'date' }
        let(:good_times) {[
          '2001-02-03',
          '2001-02-03T04:05',
          '2001-02-03T04:05:06'
        ]}
        let(:bad_times) {[
          '2001-02-03T24:05:06',
          '2001-02-03T04:05:06:07',
          '2001-02-03T04',
          'tomorrow'
        ]}
        it { is_expected.to allow_values(*good_times).for(:value) }
        it { is_expected.not_to allow_values(*bad_times).for(:value) }
      end
    end
  end

  describe '#set_property_from_key' do
    it { is_expected.to respond_to(:set_property_from_key) }

    context 'called' do
      before { expect{subject.set_property_from_key}.not_to raise_error }

      context 'when key is nil' do
        subject { FactoryBot.build(:meta_property, meta_template: meta_template, property: property, key: nil) }

        it { expect(subject.key).to be_nil }
        it { expect(subject.property).to eq(property) }
      end

      context 'when meta_template is nil' do
        subject { FactoryBot.build(:meta_property, meta_template: nil, key: property.key) }

        it { expect(subject.key).to eq(property.key) }
        it { expect(subject.meta_template).to be_nil }
        it { expect(subject.property).to be_nil }
      end

      context 'when key is a property from another template' do
        subject { FactoryBot.build(:meta_property, meta_template: meta_template, key: other_property.key) }

        it { expect(subject.key).to eq(other_property.key) }
        it { expect(subject.meta_template).to eq(meta_template) }
        it { expect(subject.property).to be_nil }
      end

      context 'when key is a property from the assigned template' do
        subject { FactoryBot.build(:meta_property, meta_template: meta_template, key: property.key) }

        it { expect(subject.key).to eq(property.key) }
        it { expect(subject.meta_template).to eq(meta_template) }
        it { expect(subject.property).to eq(property) }
      end
    end
  end

  describe 'templatable indexing' do
    let(:resource) { FactoryBot.build(:meta_property, meta_template: meta_template, key: property.key) }
    before do
      expect(meta_template).to be_persisted
      expect(property).to be_persisted
    end
    it_behaves_like 'a SearchableModel observer'
  end
end
