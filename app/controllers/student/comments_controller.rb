class Student::CommentsController < ApplicationController
  expose :course
  expose :post, parent: :course
  expose :comment, parent: :post
  before_action :ensure_student_enroll_course

  def create
  respond_to do |format|
    if comment.save
      format.turbo_stream
      format.html { redirect_to student_course_post_path(post), notice: "Comment was successfully created." }
      format.json { render :show, status: :created, location: comment }
    else
      format.turbo_stream
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    comment.destroy
    respond_to do |format|
      format.html { redirect_to student_course_post_path(course, post), status: :see_other, notice: t(".notice")  }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commenter_id, :commenter_type)
  end
  def ensure_student_enroll_course
    unless current_student.student_courses.where(course_id: course.id).exists?
      redirect_to select_student_courses_path, notice: t(".notice")
    end
  end
end
