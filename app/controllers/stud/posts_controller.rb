class Stud::PostsController < ApplicationController
  before_action :set_student
  before_action :set_course
  before_action :set_post, only: :show

  def index
    @posts = @course.posts
  end

  def show
    # Logic to display a specific post if needed
  end

  private

    def set_student
      @student = current_student
    end

    def set_course
      @course = @student.courses.find(params[:course_id])
    end

    def set_post
      @post = @course.posts.find(params[:id])
    end
end
