class Student::CommentsController < CommentsController
  private

  def redirect_path
    student_course_post_path(course, post)
  end

  def ensure_user_has_access
    unless current_student.student_courses.where(course_id: course.id).exists?
      redirect_to select_student_courses_path, notice: t(".notice")
    end
  end
end
