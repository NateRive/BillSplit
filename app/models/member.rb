class Member < ApplicationRecord
  belongs_to :group
  belongs_to :user
  attr_accessor :password
end
