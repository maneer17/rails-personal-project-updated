class Student::CoursesController < ApplicationController
  before_action :set_student
  before_action :set_course, only: %i[show]

  def index
    @courses = @student.courses.all
  end

  # mai your_progress
  def your_progress
    @student_assignments = @student.courses.map(&:assignments).flatten.count
    @submitted_assignments = @student.submissions.count
    # @student_assignments = @student.courses.joins(:assignment)
  end

  # mai Think about how we can develop this function
  def upcoming_assignments
    # @assignments = @student.courses.map(&:assignments).flatten.filter do |assignment|
    # assignment.is_active? && !assignment.is_submitted_by_student?(@student)
    # end
    @assignments = Assignment.active.joins(:course).
    where(course: { id: @student.course_ids }).filter do |assignment|
    !assignment.is_submitted_by_student?(@student)   # how can i solve the problem of checking each submission every time ?
    end
  end




  # mai Think about how we can develop this function
  def fetch_posts
    @posts= Post.joins(:course).where(course: { id: @student.course_ids })
    # @posts = Post.includes(:course).where(course: { id: @student.course_ids })
    # I'm just using the post data not the associated course date
    # in the view so no need for includes (eager loading)
    # @posts = @student.courses.map(&:posts).flatten
  end
  # mai Think about how we can develop this function
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
