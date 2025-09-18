class CommentsController < ApplicationController
  expose :course
  expose :post, parent: :course
  expose :comment, parent: :post
  before_action :ensure_user_has_access
  def create
    respond_to do |format|
      if comment.save
        format.turbo_stream
        format.html { redirect_to redirect_path, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: comment }
      else
        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if comment.update(comment_params)
        format.turbo_stream
        format.html { redirect_to redirect_path, notice: "Comment was successfully updated." }
        format.json { render :show, status: :created, location: comment }
      else
        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    comment.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to redirect_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
  def redirect_path
  end

  def comment_params
    params.require(:comment).permit(:body, :commenter_id, :commenter_type)
  end

  def ensure_user_has_access
  end
end
