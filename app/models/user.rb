class User < ActiveRecord::Base
  has_secure_password
  has_many :children
  has_many :posts, through: :children
  validates :email, presence: true, uniqueness: true
end
