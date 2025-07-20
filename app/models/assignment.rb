class Assignment < ApplicationRecord
  belongs_to :course
  has_many :submissions, dependent: :destroy

  validates :title, length: { in: 6..30 }
  validates :content, presence: :true
  validate :validate_if_deadline_date_cannot_be_in_the_past

  has_rich_text :content

  private

  def validate_if_deadline_date_cannot_be_in_the_past
    if deadline.present? && deadline < (Time.current+2.hours)
      errors.add(:deadline, "can't be in the past")
    end
  end
end
