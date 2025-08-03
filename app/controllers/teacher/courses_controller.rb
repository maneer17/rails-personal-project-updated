
class Teacher::CoursesController < ApplicationController
  before_action :set_teacher
  before_action :set_course, only: %i[show edit update destroy]
  # Mai rename function to ensure_teacher_teaches_course
  before_action :ensure_teacher_teaches_course, only: %i[show edit update destroy ]

  def index
     @courses = @teacher.courses.all
  end

  def new
    @course = @teacher.courses.new
  end

  def create
    @course = @teacher.courses.create(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to teacher_course_path(@course), notice: t(".notice") }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to teacher_course_path(@course), notice: t(".notice") }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_courses_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
    def set_teacher
      @teacher = current_teacher
    end

    def set_course
      @course = @teacher.courses.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :avatar)
    end

    def ensure_teacher_teaches_course
      unless @course.teacher_id == current_teacher.id
        redirect_to teacher_courses_path, notice: t(".notice")
      end
    end
end
