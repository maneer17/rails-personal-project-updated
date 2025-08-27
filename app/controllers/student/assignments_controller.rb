class Student::AssignmentsController < ApplicationController
  expose :course
  expose :assignment, parent: :course
  expose :assignments, from: :course
  expose :student, :current_student
  before_action :ensure_student_enroll_course

  private
    def ensure_student_enroll_course
      unless student.student_courses.where(course_id: course.id).exists?
        redirect_to new_courses_student_courses_path, notice: t(".notice")
      end
    end
end
