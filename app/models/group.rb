class Group < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validate :add_error_message
  has_many :members,dependent: :destroy
  has_many :users, through: :members
  has_many :charges, dependent: :destroy





  def add_error_message
    if password.length < 6 || password.length > 12
      errors[:password] << "is too long or too short"
    end
  end
end
