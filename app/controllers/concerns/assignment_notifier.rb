module AssignmentNotifier
  extend ActiveSupport::Concern
  included do
    after_action :notify_students, only: [ :create ]
  end

  private
  def notify_students
    if assignment.persisted?
      NewAssignmentMailer.with(course: course, assignment: assignment).new_assignment_email.deliver_later
    end
  end
end
