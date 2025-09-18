class Teacher::CommentsController < CommentsController
  private
  def redirect_path
    teacher_course_post_path(comment.post.course, comment.post)
  end
  def ensure_user_has_access
      unless course.teacher_id == current_teacher.id
        redirect_to teacher_courses_path, notice: t(".notice")
      end
  end
end
