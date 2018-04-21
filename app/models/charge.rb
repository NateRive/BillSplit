class Charge < ApplicationRecord
  has_many :charged_users
  belongs_to :group
  belongs_to :user
  validates :amount, presence: true
  validates :title, presence: true
end
