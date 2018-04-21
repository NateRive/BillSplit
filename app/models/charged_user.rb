class ChargedUser < ApplicationRecord
  belongs_to :charge
  belongs_to :user
  validates :user_id, presence: true
  validates :charge_id, presence: true
end
