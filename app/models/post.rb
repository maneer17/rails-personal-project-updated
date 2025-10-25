class Post < ApplicationRecord
  scope :x_course_posts, ->(course) { where("course_id = ? ", course) }

  belongs_to :course
  has_many :comments, dependent: :destroy

  has_rich_text :body
end
