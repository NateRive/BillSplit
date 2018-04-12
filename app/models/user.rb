class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :members
  has_many :groups, through: :members
  validates :name, uniqueness: true
  validate :add_error_messages

  def add_error_messages
    if name.empty?
      errors[:base] << "You are lazy and super idiot"
    end
  end



end
