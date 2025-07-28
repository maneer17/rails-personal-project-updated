class Student::CoursesController < ApplicationController
  before_action :set_student
  before_action :set_course, only: %i[show]

  def index
    @courses = @student.courses.all
  end

  # mai your_progress
  def progress_bar
    @total = @student.courses.map(&:assignments).flatten.count
    @submitted = @student.submissions.count

    # mai  move these line to the view and check if student has assignments show the progress, without using begin and rescue
    begin
      @progress = ((@submitted/@total) *100).round
    rescue FloatDomainError
      @progress = 0
    end
  end

  # mai Think about how we can develop this function
  def upcoming_assignments
    @assignments = []
    courses = @student.courses

    courses.each do |course|
      course.assignments.each do |assignment|
        if !current_student.submissions.exists?(assignment_id: assignment.id) &&
          assignment.deadline > Time.current
          @assignments << assignment
        end
      end
    end
  end


  # mai Think about how we can develop this function
  def fetch_posts
    student_courses = current_student.courses
    courses_with_posts = student_courses.includes(:posts)
    all_posts = []
    courses_with_posts.each do |course|
      all_posts.concat(course.posts)
    end
    @posts = all_posts
  end

  # mai Think about how we can develop this function
  def select
    @student = current_student
    all_courses = Course.all
    student_courses = @student.courses
    @courses = []
    all_courses.each do |course|
      unless student_courses.include?(course)
        @courses.append(course)
      end
    end
  end

  def enroll
    @course = Course.find(params[:course_id])
    current_student.courses << (@course)

    respond_to do |format|
      format.html { redirect_to select_student_courses_path, notice: t(".notice") }
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
