class Post < ApplicationRecord
  has_rich_text :body
  belongs_to :course
  has_many :comments
  scope :x_course_posts, ->(course ) { where('course_id = ? ', course)}
end
