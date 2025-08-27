class Student::SubmissionsController < ApplicationController
  expose :student, :current_student
  expose :course
  expose :assignment, parent: :course
  expose :submission, parent: :student

  def create
    respond_to do |format|
      if submission.save
        format.html do
          redirect_to student_course_assignment_submission_path(course, assignment, submission),
                      notice: t(".notice")
        end
        format.json { render :show, status: :created, location: submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: submission.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :file, :assignment_id)
  end
end
