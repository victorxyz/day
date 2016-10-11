class Campaign < ApplicationRecord
  belongs_to :user
  belongs_to :beneficiary
  has_many :volunteers, dependent: :nullify
  has_many :donations, dependent: :nullify
  def donations_total
    donations.sum(:amount)
  end
end
