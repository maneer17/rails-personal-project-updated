class Student::SubmissionsController < ApplicationController
  before_action :set_student
  before_action :set_course
  before_action :set_assignment
  before_action :set_submission, only: %i[ show]

  def index
    @submissions = @assignment.submissions.where(student_id: @student.id)
  end

  def show
    @submission = @assignment.submissions.where(student_id: @student.id)
  end

  def new
    @submission = @assignment.submissions.build
  end

  def create
    @submission = @assignment.submissions.build(submission_params)

    respond_to do |format|
      if @submission.save
        format.html { redirect_to student_course_assignment_submission_path(@course, @assignment, @submission), notice: t(".notice") }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_student
    @student = current_student
  end

  def set_course
    @course = @student.courses.find(params[:course_id])
  end

  def set_assignment
    @assignment = @course.assignments.find(params[:assignment_id])
  end

  def set_submission
    @submission = current_student.submissions.find_by(assignment_id: params[:assignment_id])
  end

  def submission_params
    params.require(:submission).permit(:title, :file, :assignment_id, :student_id)
  end
end
