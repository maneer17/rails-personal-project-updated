# app/controllers/teach/courses_controller.rb
class Student::CoursesController < ApplicationController
  before_action :set_student
  before_action :set_course, only: %i[ show]

  # GET /teach/courses or /teach/courses.json
  def index
      @courses = @student.courses.all
  end

  def progress_bar
    @total = 0.0
    @submitted = @student.submissions.count
    (@student.courses).each do |course|
      @total += course.assignments.count
    end
    begin
      @progress = ((@submitted/@total) *100).round
    rescue FloatDomainError
      @progress = 0
    end
  end

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

  def fetch_posts
    student_courses = current_student.courses
    courses_with_posts = student_courses.includes(:posts)
    all_posts = []
    courses_with_posts.each do |course|
      all_posts.concat(course.posts)
    end
    @posts = all_posts
  end

  def show
  end

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
  # PATCH/PUT /teach/courses/1 or /teach/courses/1.json
  private

    # Use callbacks to share common setup or constraints between actions.
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

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:student).permit(:course_ids[])
    end
end
