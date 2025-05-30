class Teach::CommentsController < ApplicationController
  def destroy
    @teacher = current_teacher
    @course = @teacher.courses.find(params[:course_id])
    @post = @course.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to teach_course_post_comments_path, status: :see_other, notice: "comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
