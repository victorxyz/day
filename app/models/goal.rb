class Goal < ApplicationRecord
  self.per_page = 2
  belongs_to :user
  belongs_to :beneficiary
  has_many :pledges, dependent: :nullify
  def pledges_total
    pledges.sum(:amount)
  end
  # def self.search(search)
  #   # where("title LIKE ? OR description LIKE ? OR user_id LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  #   puts search
  #   where("lower(title) LIKE ? OR description LIKE ?" , "%#{search.downcase}%", "%#{search.downcase}%")
  # end
end
