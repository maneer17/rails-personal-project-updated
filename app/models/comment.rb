class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :post
end
