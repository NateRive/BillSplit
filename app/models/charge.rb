class Charge < ApplicationRecord
  has_many :charged_users, dependent: :destroy
  belongs_to :group
  belongs_to :user
  validate :check_amount
  validates :title, presence: true


  def check_amount
    if amount <= 0
      errors[:base] << "正しくない請求額です"
    end
  end
end
