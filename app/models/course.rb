class Course < ApplicationRecord
  belongs_to :teacher
  has_many :student_courses
  has_many :students, through: :student_courses, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_one_attached :avatar, dependent: :destroy


  scope :my_courses, ->(student) {
  joins(:student_courses).where(student_courses: { student_id: student.id })
  }
  def teachedBy?(teacher)
    self.teacher == teacher
  end
end
