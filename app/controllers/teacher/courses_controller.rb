class Teacher::CoursesController < ApplicationController
  expose :teacher, :current_teacher
  expose :course, parent: :teacher
  expose :courses, -> { teacher.courses.all }
  before_action :ensure_teacher_teaches_course, only: %i[show edit update destroy ]
  def create
    respond_to do |format|
      course.avatar.attach(params[:avatar])
      if course.save
        format.html { redirect_to teacher_course_path(course), notice: t(".notice") }
        format.json { render :show, status: :created, location: course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if course.update(course_params)
        format.html { redirect_to teacher_course_path(course), notice: t(".notice") }
        format.json { render :show, status: :ok, location: course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    course.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_courses_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private

    def course_params
      params.require(:course).permit(:name, :description, :avatar)
    end

    def ensure_teacher_teaches_course
      unless course.teacher_id == teacher.id
        redirect_to teacher_courses_path, notice: t(".notice")
      end
    end
end
