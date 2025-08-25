class Student::CoursesController < ApplicationController
  before_action :set_student
  before_action :set_course, only: %i[show]

  def index
    @courses = @student.courses.all
  end

  def your_progress
    @student_assignments = @student.courses.map(&:assignments).flatten.count
    @submitted_assignments = @student.submissions.count
  end

  def upcoming_assignments
    @assignments = UpcomingAssignment.where(student_id: @student.id)
  end

  def fetch_posts
    @posts= Post.joins(:course).where(course: { id: @student.course_ids })
  end
  def new_courses
   @courses = Course.where.not(id: @student.course_ids)
  end

  def enroll
    @course = Course.find(params[:course_id])
    current_student.courses << (@course)

    respond_to do |format|
      format.html { redirect_to new_courses_student_courses_path, notice: t(".notice") }
    end
  end

  def unenroll
    @course = Course.find(params[:course_id])
    current_student.courses.delete(@course)

    respond_to do |format|
      format.html { redirect_to student_courses_path, notice: t(".notice") }
    end
  end

  private
  def set_student
    @student = current_student
  end

  def set_course
    begin
      @course = @student.courses.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/404"
    end
  end

  def course_params
    params.require(:student).permit(:course_ids[])
  end
end
