class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, polymorphic: true
  validates :body, presence: true
  broadcasts_to :post
  scope :ordered, -> { order(id: :desc) }
end
