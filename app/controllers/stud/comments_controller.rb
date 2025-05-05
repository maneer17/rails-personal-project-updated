class Stud::CommentsController < ApplicationController
  def create
    @student = current_student 
    @course = @student.courses.find(params[:course_id])
    @post = @course.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.student_id = @student.id
    if @comment.save
      redirect_to stud_course_posts_path(@post)
    end
  end
  
  def destroy
    @student = current_student 
    @course = @student.courses.find(params[:course_id])
    @post = @course.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to stud_course_post_comments_path, status: :see_other, notice: "comment was successfully destroyed." }
      format.json { head :no_content }
  
  end
end
  private
    def comment_params
      params.require(:comment).permit(:student_id, :body)
    end
  end