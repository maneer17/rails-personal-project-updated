class Student::AssignmentsController < ApplicationController
    before_action :set_course
    before_action :ensure_student_enroll_course

    def index
      @assignments = @course.assignments.all
    end

    def show
      @student = current_student
      @assignment = @course.assignments.find(params[:id])
    end

    private
    def set_course
      @course = Course.find(params[:course_id])
    end

    def ensure_student_enroll_course
      unless current_student.student_courses.where(course_id: @course.id).exists?
        redirect_to select_student_courses_path, notice: t(".notice")
      end
    end
end
