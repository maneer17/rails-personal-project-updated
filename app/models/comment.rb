class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, polymorphic: true
  validates :body, presence: true
end
