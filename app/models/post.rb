class Post < ApplicationRecord
  scope :x_course_posts, ->(course) { where("course_id = ? ", course) }

  belongs_to :course
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true,  reject_if: lambda { |attributes| attributes["body"].blank? }
  validates :body, presence: true

  has_rich_text :body
end
