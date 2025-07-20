class Post < ApplicationRecord
  scope :x_course_posts, ->(course) { where("course_id = ? ", course) }

  belongs_to :course
  has_many :comments

  has_rich_text :body
end
