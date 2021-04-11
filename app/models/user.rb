class User < ApplicationRecord
  has_many :posts
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates :username, presence: true
  validates :password, presence: true

  has_secure_password
end
