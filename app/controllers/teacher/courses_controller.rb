
class Teacher::CoursesController < ApplicationController
  before_action :set_teacher
  before_action :set_course, only: %i[show edit update destroy]
  before_action :teacher_teaches_course, only: %i[ show edit update destroy ]
  # GET /teach/courses or /teach/courses.json
  def index
      @courses = @teacher.courses.all
  end

  def new
    @hello =I18n.t("hello")
    @course = @teacher.courses.new
  end

  # POST /teach/courses or /teach/courses.json
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

  # PATCH/PUT /teach/courses/1 or /teach/courses/1.json
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

  # DELETE /teach/courses/1 or /teach/courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_courses_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = current_teacher
    end

    def set_course
      @course = @teacher.courses.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :description, :avatar)
    end

    def teacher_teaches_course
      unless @course.teacher_id == current_teacher.id
        redirect_to teacher_courses_path, notice: t(".notice")
      end
    end
end
