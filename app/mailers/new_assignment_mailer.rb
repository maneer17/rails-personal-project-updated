class NewAssignmentMailer < ApplicationMailer
  default from: "maneeer2006@gmail.com"
  def new_assignment_email
    @assignment = params[:assignment]
    @course = params[:course]
    mail(to: @course.students, subject: "New Assignment")
  end
end
