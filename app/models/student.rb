class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :submissions
  has_many :comments, as: :commenter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
