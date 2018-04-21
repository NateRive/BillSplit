class Group < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  # validates :password, length: { maximum: 12 }
  # validates :password, length: { minimum: 6 }
  validate :add_error_message
  has_many :members
  has_many :users, through: :members
  has_many :charges





  def add_error_message
    if password.length < 6 || password.length > 12
      errors[:password] << "is too long or too short"
    end
  end
end
