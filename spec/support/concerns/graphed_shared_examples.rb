shared_context 'Graphed::Base' do
  it { expect(described_class).to include(Graphed::Base) }
  it { expect(described_class).to include(JobTransactionable) }

  describe '#graph_model_object' do
    include_context 'performs enqueued jobs', only: GraphPersistenceJob
    it { is_expected.to respond_to :graph_model_object }
    it { expect{subject.graph_model_object}.not_to raise_error }
  end

  it_behaves_like 'a job_transactionable model'
end
# These are Graphed::Node models
shared_examples 'a graphed node' do |logically_deleted: false|
  include_context 'Graphed::Base'
  let(:kind_name) {subject.class.name}
  let(:graph_node_name) { "Graph::#{kind_name}" }
  let(:graph_model_class) { graph_node_name.constantize }
  let(:graph_hash) { {model_id: subject.id, model_kind: subject.kind} }

  it { expect(described_class).to include(Graphed::Node) }

  describe '#graph_model_name' do
    it { is_expected.to respond_to :graph_model_name }
    it { expect(subject.graph_model_name).to eq kind_name }
  end

  describe '#graph_model_class' do
    it { is_expected.to respond_to :graph_model_class }
    it { expect(subject.graph_model_class).to eq graph_model_class }
  end

  describe '#graph_node' do
    let(:a_graph_node) { Object.new }
    it { is_expected.to respond_to :graph_node }
    it 'calls graph_model_class.find_by_graph_hash' do
      expect(graph_model_class).to receive(:find_by_graph_hash).with(model_id: subject.id, model_kind: subject.kind).and_return(a_graph_node)
      expect(subject.graph_node).to eq a_graph_node
    end
  end

  describe '#create_graph_node' do
    let(:job_transaction) { GraphPersistenceJob.initialize_job(subject) }
    it { is_expected.to respond_to :create_graph_node }
    it 'calls GraphPersistenceJob.perform_later with arguments' do
      expect(GraphPersistenceJob).to receive(:initialize_job)
        .with(subject)
        .and_return(job_transaction)
      expect(GraphPersistenceJob).to receive(:perform_later)
        .with(job_transaction, graph_node_name, action: "create", graph_hash: {model_id: subject.id, model_kind: subject.kind}).and_call_original
      expect(subject.create_graph_node).to be_truthy
    end
    it 'enqueues a GraphPersistenceJob' do
      expect(subject).to be_persisted
      expect {
        expect(subject.create_graph_node).to be_truthy
      }.to have_enqueued_job(GraphPersistenceJob)
    end
    context 'with inline queue adapter' do
      include_context 'performs enqueued jobs', only: GraphPersistenceJob

      it 'calls graph_model_class.create' do
        expect(graph_model_class).to receive(:create).with(model_id: subject.id, model_kind: subject.kind).and_return(true)
        expect(subject.create_graph_node).to be_truthy
      end
    end
  end

  describe '#delete_graph_node' do
    let(:job_transaction) { GraphPersistenceJob.initialize_job(subject) }
    it { is_expected.to respond_to :delete_graph_node }

    it 'calls GraphPersistenceJob.perform_later with arguments' do
      expect(GraphPersistenceJob).to receive(:initialize_job)
        .with(subject)
        .and_return(job_transaction)
      expect(GraphPersistenceJob).to receive(:perform_later)
        .with(job_transaction, graph_node_name, action: "delete", graph_hash: {model_id: subject.id, model_kind: subject.kind}).and_call_original
      expect(subject.delete_graph_node).to be_truthy
    end

    it 'enqueues a GraphPersistenceJob' do
      expect(subject).to be_persisted
      expect {
        expect(subject.delete_graph_node).to be_truthy
      }.to have_enqueued_job(GraphPersistenceJob)
    end

    context 'with inline queue adapter' do
      include_context 'performs enqueued jobs', only: GraphPersistenceJob

      let(:a_graph_node) { double("graph_node") }
      it 'calls graph_node.destroy' do
        allow(a_graph_node).to receive(:destroy)
        expect(graph_model_class).to receive(:find_by_graph_hash).with(model_id: subject.id, model_kind: subject.kind).and_return(a_graph_node)
        expect(a_graph_node).to receive(:destroy).and_return(true)
        expect(subject.delete_graph_node).to be_truthy
      end
    end
  end

  if logically_deleted
    describe '#logically_delete_graph_node' do
      let(:job_transaction) { GraphPersistenceJob.initialize_job(subject) }
      let(:logical_delete_attributes) { {is_deleted: subject.is_deleted} }
      before do
        expect(subject).to be_persisted
        subject.is_deleted = true
      end

      it { is_expected.to respond_to :logically_delete_graph_node }
      it 'calls GraphPersistenceJob.perform_later with arguments' do
        expect(GraphPersistenceJob).to receive(:initialize_job)
          .with(subject)
          .and_return(job_transaction)
        expect(GraphPersistenceJob).to receive(:perform_later)
          .with(job_transaction, graph_node_name, action: "update", graph_hash: graph_hash, attributes: logical_delete_attributes).and_call_original
        expect(subject.logically_delete_graph_node).to be_truthy
      end

      it 'enqueues a GraphPersistenceJob' do
        expect {
          expect(subject.logically_delete_graph_node).to be_truthy
        }.to have_enqueued_job(GraphPersistenceJob)
      end

      context 'without changing #is_deleted' do
        before { expect(subject.reload).to be_truthy }

        it 'enqueues a GraphPersistenceJob' do
          expect(subject).to be_persisted
          expect {
            subject.logically_delete_graph_node
          }.not_to have_enqueued_job(GraphPersistenceJob)
        end
      end

      context 'with inline queue adapter' do
        include_context 'performs enqueued jobs', only: GraphPersistenceJob

        let(:a_graph_node) { double("graph_node") }
        it 'calls graph_node.destroy' do
          allow(a_graph_node).to receive(:update)
          expect(graph_model_class).to receive(:find_by_graph_hash).with(graph_hash).and_return(a_graph_node)
          expect(a_graph_node).to receive(:update).with(logical_delete_attributes).and_return(true)
          expect(subject.logically_delete_graph_node).to be_truthy
        end
      end
    end
  end

  context 'with inline queue adapter' do
    include_context 'performs enqueued jobs', only: GraphPersistenceJob

    before do
      expect(subject).to be
    end

    it 'should auto_create' do
      expect(graph_node_name.constantize.where(model_id: subject.id, model_kind: subject.kind).first).to be
    end

    it 'should return the graphed model' do
      expect(graph_node_name.constantize.where(model_id: subject.id, model_kind: subject.kind).count).to eq(1)
      expect(subject.graph_node).to be
      expect(graph_node_name.constantize.where(model_id: subject.id, model_kind: subject.kind).count).to eq(1)
      expect(subject.graph_node.model_id).to eq(subject.id)
      expect(subject.graph_node.model_kind).to eq(subject.kind)
    end

    context 'when model is deleted' do
      before do
        expect(subject).to be
        expect(subject.graph_node).to be
      end

      if logically_deleted
        it { is_expected.to callback(:logically_delete_graph_node).after(:save) }
        it 'should logicially delete graph_node with the model' do
          expect(graph_node_name.constantize.where(model_id: subject.id, model_kind: subject.kind).count).to eq(1)
          subject.update_attribute(:is_deleted, true)
          expect(graph_node_name.constantize.where(model_id: subject.id, model_kind: subject.kind).count).to eq(1)
          expect(subject.graph_node).to be
          expect(subject.graph_node.is_deleted).to be_truthy
        end
        context 'when graph_node does not exist' do
          before do
            subject.delete_graph_node
            subject.is_deleted = true
          end
          it { expect{subject.logically_delete_graph_node}.to raise_error(Neo4j::ActiveNode::Labels::RecordNotFound) }
        end
      end
      it { is_expected.to respond_to :delete_graph_node }
      it { is_expected.to callback(:delete_graph_node).after(:destroy) }
      it 'should destroy graph_node with the model' do
        expect(graph_node_name.constantize.where(model_id: subject.id, model_kind: subject.kind).first).to be
        subject.destroy
        expect(graph_node_name.constantize.where(model_id: subject.id, model_kind: subject.kind).first).not_to be
      end
    end
  end
end # a graphed node

# These are Graphed::Relation objects, which are all ProvRelations
shared_examples 'a graphed relation' do
  include_context 'Graphed::Base'

  # these MUST be provided in the model spec
  #let(:rel_type) { 'SomeAssociation' }
  #let(:from_model) { activerecordmodel }
  #let(:to_model) { activerecordmodel }
  let(:from_node) { from_model.graph_node }
  let(:to_node) { to_model.graph_node }
  let(:graphed_relation) { from_node.query_as(:from).match("(from)-[r:#{rel_type}]->(to)").where('to.model_id = {m_id}').params(m_id: to_model.id).pluck(:r).first }
  let(:graph_relation_name) { "Graph::#{rel_type}" }
  let(:graph_model_class) { graph_relation_name.constantize }
  let(:graph_hash) {
    {
      model_id: subject.id,
      model_kind: subject.kind,
      from_node: {model_id: from_model.id, model_kind: from_model.kind},
      to_node: {model_id: to_model.id, model_kind: to_model.kind}
    }
  }

  it { expect(described_class).to include(Graphed::Relation) }
  it { is_expected.to respond_to :graph_relation }
  it { is_expected.to respond_to :manage_graph_relation }
  it { is_expected.to callback(:delete_graph_relation).after(:destroy) }
  it { is_expected.to callback(:manage_graph_relation).around(:update) }

  describe '#create_graph_relation' do
    let(:job_transaction) { GraphPersistenceJob.initialize_job(subject) }
    it { is_expected.to respond_to :create_graph_relation }
    it 'calls GraphPersistenceJob.perform_later with arguments' do
      expect(GraphPersistenceJob).to receive(:initialize_job)
        .with(subject)
        .and_return(job_transaction)
      expect(GraphPersistenceJob).to receive(:perform_later)
        .with(job_transaction, graph_relation_name, action: "create", graph_hash: graph_hash).and_call_original
      expect(subject.create_graph_relation).to be_truthy
    end
    it 'enqueues a GraphPersistenceJob' do
      expect(subject).to be_persisted
      expect {
        expect(subject.create_graph_relation).to be_truthy
      }.to have_enqueued_job(GraphPersistenceJob)
    end
    context 'with inline queue adapter' do
      include_context 'performs enqueued jobs', only: GraphPersistenceJob

      it 'calls graph_model_class.create' do
        expect(graph_model_class).to receive(:create).with(model_id: subject.id, model_kind: subject.kind, from_node: from_node, to_node: to_node).and_return(true)
        expect(subject.create_graph_relation).to be_truthy
      end
    end
  end

  describe '#delete_graph_relation' do
    let(:job_transaction) { GraphPersistenceJob.initialize_job(subject) }
    it { is_expected.to respond_to :delete_graph_relation }

    it 'calls GraphPersistenceJob.perform_later with arguments' do
      expect(GraphPersistenceJob).to receive(:initialize_job)
        .with(subject)
        .and_return(job_transaction)
      expect(GraphPersistenceJob).to receive(:perform_later)
        .with(job_transaction, graph_relation_name, action: "delete", graph_hash: graph_hash).and_call_original
      expect(subject.delete_graph_relation).to be_truthy
    end

    it 'enqueues a GraphPersistenceJob' do
      expect(subject).to be_persisted
      expect {
        expect(subject.delete_graph_relation).to be_truthy
      }.to have_enqueued_job(GraphPersistenceJob)
    end

    context 'with inline queue adapter' do
      include_context 'performs enqueued jobs', only: GraphPersistenceJob

      let(:a_graph_relation) { double("graph_relation") }
      it 'calls graph_relation.destroy' do
        allow(a_graph_relation).to receive(:destroy)
        expect(graph_model_class).to receive(:find_by_graph_hash).with(graph_hash).and_return(a_graph_relation)
        expect(a_graph_relation).to receive(:destroy).and_return(true)
        expect(subject.delete_graph_relation).to be_truthy
      end
    end
  end

  describe '#graph_model_name' do
    it { is_expected.to respond_to :graph_model_name }
    it { expect(subject.graph_model_name).to eq rel_type }
  end

  describe '#graph_model_class' do
    it { is_expected.to respond_to :graph_model_class }
    it { expect(subject.graph_model_class).to eq graph_model_class }
  end

  describe '#graph_from_model' do
    it { is_expected.to respond_to :graph_from_model }
    it { expect(subject.graph_from_model).to eq from_model }
  end

  describe '#graph_to_model' do
    it { is_expected.to respond_to :graph_to_model }
    it { expect(subject.graph_to_model).to eq to_model }
  end

  context 'with inline queue adapter' do
    include_context 'performs enqueued jobs', only: GraphPersistenceJob

    describe '#graph_from_node' do
      it { is_expected.to respond_to :graph_from_node }
      it { expect(subject.graph_from_node).to eq from_node }
    end

    describe '#graph_to_node' do
      it { is_expected.to respond_to :graph_to_node }
      it { expect(subject.graph_to_node).to eq to_node }
    end

    it 'should auto_create' do
      expect(subject).to be
      expect(graphed_relation).to be
    end
    it 'should return the graphed relation of rel_type between from_model.graph_node and to_model.graph_node' do
      expect(subject).to be
      expect(from_node.query_as(:from).match("(from)-[r:#{rel_type}]->(to)").where('to.model_id = {m_id}').params(m_id: to_model.id).pluck(:r).count).to eq(1)
      expect(subject.graph_relation).to be
      expect(from_node.query_as(:from).match("(from)-[r:#{rel_type}]->(to)").where('to.model_id = {m_id}').params(m_id: to_model.id).pluck(:r).count).to eq(1)
      graphed_relation = subject.graph_relation
      expect(graphed_relation.model_id).to eq(subject.id)
      expect(graphed_relation.model_kind).to eq(subject.kind)
      expect(graphed_relation.from_node.model_id).to eq(from_model.id)
      expect(graphed_relation.to_node.model_id).to eq(to_model.id)
    end
  end

  context 'when model is deleted' do
    include_context 'performs enqueued jobs', only: GraphPersistenceJob

    before do
      expect(subject).to be
      expect(subject.graph_relation).to be
    end

    it 'should destroy graph_relation with the model' do
      is_expected.to be_persisted
      expect(graphed_relation).to be
      subject.destroy
      expect(from_node.query_as(:from).match("(from)-[r:#{rel_type}]->(to)").where('to.model_id = {m_id}').params(m_id: to_model.id).pluck(:r).first).not_to be
    end

    it 'should destroy graph_relation when model is logically_deleted deleted' do
      is_expected.to be_persisted
      expect(subject.is_deleted?).to be_falsey
      expect(graphed_relation).to be
      subject.update(is_deleted: true)
      expect(from_node.query_as(:from).match("(from)-[r:#{rel_type}]->(to)").where('to.model_id = {m_id}').params(m_id: to_model.id).pluck(:r).first).not_to be
    end
  end

  describe 'manage_graph_relation' do
    context 'when is_deleted not changed' do
      it {
        expect(subject.is_deleted_changed?).to be_falsey
        yield_called = false
        is_expected.not_to receive(:delete_graph_relation)
        subject.manage_graph_relation do
          yield_called = true
        end
        expect(yield_called).to be_truthy
      }
    end

    context 'when is_deleted changed from false to true' do
      it {
        expect(subject.is_deleted?).to be_falsey
        yield_called = false
        subject.is_deleted = true
        is_expected.to receive(:delete_graph_relation)
        subject.manage_graph_relation do
          yield_called = true
        end
        expect(yield_called).to be_truthy
      }
    end
  end
end #a graphed relation

# These are Graph::* Neo4j graph objects
shared_examples 'a graphed model' do
  include_context 'performs enqueued jobs', only: GraphPersistenceJob
  it { expect(described_class).to include(Graphed::Model) }
  it { expect(described_class).to respond_to(:find_by_graph_hash) }
  it { expect(described_class).to respond_to(:create_with_graph_hash) }
  it { is_expected.to respond_to('graphed_model') }

  context 'graphed_model'do
    it 'should return the Model that is graphed based on its model_kind and model_id' do
      graphed_model = subject.graphed_model
      expect(graphed_model).to be
      expect(graphed_model.kind).to eq(subject.model_kind)
      expect(graphed_model.id).to eq(subject.model_id)
    end
  end

  context 'graphed_model(scope)' do
    it 'should append its query to the supplied scope' do
      expect(subject.graphed_model(KindnessFactory.by_kind(subject.model_kind))).to be
      expect(subject.graphed_model(KindnessFactory.by_kind(subject.model_kind).none)).not_to be
    end
  end
end

shared_examples 'a Graphed::NodeModel' do
  describe '::find_by_graph_hash' do
    let(:graph_hash) { {foo: 'bar'} }
    let(:a_graph_node) { double("graph_node") }
    it { expect(described_class).to respond_to(:find_by_graph_hash).with(1).argument }
    it 'calls find_by! and returns a graph_node' do
      expect(described_class).to receive(:find_by!).with(graph_hash).and_return(a_graph_node)
      expect(described_class.find_by_graph_hash(graph_hash)).to eq(a_graph_node)
    end

    it { expect{described_class.find_by_graph_hash(graph_hash)}.to raise_error(Neo4j::ActiveNode::Labels::RecordNotFound) }
  end
end

shared_examples 'A ProvenanceGraph' do |
  includes_node_syms: [],
  includes_relationship_syms: [],
  excludes_node_syms: [],
  excludes_relationship_syms: [],
  with_restricted_properties: false|

  let(:includes_nodes) {
    includes_node_syms.map{|enode| send(enode) }
  }
  let(:excludes_nodes) {
    excludes_node_syms.map{|enode| send(enode) }
  }
  let(:includes_relationships) {
    includes_relationship_syms.map{|enode| send(enode) }
  }
  let(:excludes_relationships) {
    excludes_relationship_syms.map{|enode| send(enode) }
  }
  if with_restricted_properties
    let (:properties_restricted) { true }
  else
    let(:properties_restricted) { false }
  end

  it {
    includes_nodes.each do |included_node|
      graphed_node = ProvenanceGraphNode.new(included_node.graph_node)
      graphed_node.restricted = properties_restricted
      expect(subject.nodes).to include(graphed_node)
    end

    excludes_nodes.each do |excluded_node|
      graphed_node = ProvenanceGraphNode.new(excluded_node.graph_node)
      graphed_node.restricted = properties_restricted
      expect(subject.nodes).not_to include(graphed_node)
    end

    includes_relationships.each do |included_relationship|
      graphed_relationship = ProvenanceGraphRelationship.new(included_relationship.graph_relation)
      graphed_relationship.restricted = properties_restricted
      expect(subject.relationships).to include(graphed_relationship)
    end

    excludes_relationships.each do |excluded_relationship|
      graphed_relationship = ProvenanceGraphRelationship.new(excluded_relationship.graph_relation)
      graphed_relationship.restricted = properties_restricted
      expect(subject.relationships).not_to include(graphed_relationship)
    end
  }
end
