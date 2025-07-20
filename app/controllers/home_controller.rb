class HomeController < ApplicationController
  before_action :redirect_based_on_role

  private

  def redirect_based_on_role
    if current_teacher
      redirect_to teacher_courses_path
    elsif current_student
      redirect_to student_courses_path
    else
      redirect_to new_student_session_path
    end
  end
end
