require 'rails_helper'

RSpec.describe Graph::Agent do
  before(:example) { resource.create_graph_node }
  subject { resource.graph_model_object }

  context 'User' do
    let(:resource) { FactoryBot.create(:user) }
    it_behaves_like 'a graphed model' do
      it_behaves_like 'a Graphed::NodeModel'
    end
  end

  context 'SoftwareAgent' do
    let(:resource) { FactoryBot.create(:software_agent) }
    it_behaves_like 'a graphed model' do
      it_behaves_like 'a Graphed::NodeModel'
    end
  end
end
