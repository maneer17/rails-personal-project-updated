class Student::CoursesController < ApplicationController
  expose :student, :current_student
  expose :course
  expose :courses, from: :student

  def your_progress
    @student_assignments = courses.map(&:assignments).flatten.count
    @submitted_assignments = student.submissions.count
  end

  def upcoming_assignments
    @assignments = UpcomingAssignment.where(student_id: student.id)
  end

  def fetch_posts
    @posts= Post.joins(:course).where(course: { id: student.course_ids })
  end
  def new_courses
   @courses = Course.where.not(id: student.course_ids)
  end

  def enroll
    courses << course

    respond_to do |format|
      format.html { redirect_to new_courses_student_courses_path, notice: t(".notice") }
    end
  end

  def unenroll
    student.courses.delete(course)

    respond_to do |format|
      format.html { redirect_to student_courses_path, notice: t(".notice") }
    end
  end

  private
  def course_params
    params.require(:student).permit(:course_ids[])
  end
end
