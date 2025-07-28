class Student::AssignmentsController < ApplicationController
  before_action :set_assignment, only: :show
  before_action :set_course
  # mai rename function ensure_student_enroll_course
  before_action :check_enrollment

  def index
    @assignments = @course.assignments.all
  end

  def show
    @student = current_student
    @assignment = Assignment.find(params[:id])

    # mai, make these tow lines as instance method
    @is_submitted = @student.submissions.exists?(assignment_id: @assignment.id)
    @is_deadline_finished = @assignment.deadline < Time.now
  end

  def set_assignment
    @course = Course.find(params[:course_id])
    @assignment = @course.assignments.find(params[:id])
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :content, :deadline, :course_id)
  end

  def check_enrollment
    # mai, Think about it a little, why do you bring all the courses and compare them? why you don't use where
    unless current_student.courses.include?(@course)
      redirect_to select_student_courses_path, notice: t(".notice")
    end
  end
end
