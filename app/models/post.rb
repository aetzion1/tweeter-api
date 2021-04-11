class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :text, presence: true
  validates :likes, presence: true
  validates :repost_count, presence: true
end
