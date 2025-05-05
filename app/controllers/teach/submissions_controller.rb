class Teach::SubmissionsController < ApplicationController
  before_action :set_assignment

  def index
    @submissions=@assignment.submissions.all
    @count = @submissions.count
  end


  def show
    @submission=@assignment.submissions.find(:id)
  end

  private

  def set_assignment
    @course = current_teacher.courses.find(params[:course_id])
    @assignment = @course.assignments.find(params[:assignment_id])
  end

end
