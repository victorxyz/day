class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  validates :quantity, presence: true
  validate :limit_volunteers
  private
  def limit_volunteers
    if quantity > 1
      errors.add(:quantity, "can't be greater than total value")
    end
  end

end
