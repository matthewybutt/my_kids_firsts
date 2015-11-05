class User < ActiveRecord::Base
  has_secure_password
  has_many :children, dependent: :destroy
  has_many :posts, through: :children
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}
end
