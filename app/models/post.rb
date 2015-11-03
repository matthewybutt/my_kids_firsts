class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :child
  validates :title, presence: true
end
