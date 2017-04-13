class ChildDeletionJob < ApplicationJob
  queue_as :child_deletion

  def perform(job_transaction, parent)
    self.class.start_job(job_transaction)
    parent.children.each do |child|
      child.current_transaction = job_transaction if child.class.include? ChildMinder
      child.update(is_deleted: true)
    end
    self.class.complete_job(job_transaction)
  end
end