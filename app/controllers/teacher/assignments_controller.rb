class Teacher::AssignmentsController < ApplicationController
  before_action :set_course
  before_action :set_assignment, only: %i[ show edit update destroy ]
  before_action :ensure_teacher_teaches_course

  def index
    @assignments = @course.assignments.all
  end

  def new
    @assignment = @course.assignments.build
  end

  def create
    @assignment = @course.assignments.create(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to teacher_course_assignments_path, notice: t(".notice") }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to [ :teacher, @course, @assignment ], notice: t(".notice") }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_course_assignments_path, status: :see_other, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_assignment
    @assignment = @course.assignments.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :content, :deadline)
  end

  def ensure_teacher_teaches_course
    unless @course.teacher_id == current_teacher.id
      redirect_to teacher_courses_path, notice: t(".notice")
    end
  end
end
