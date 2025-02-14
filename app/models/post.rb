class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true, length: { maximum: 25 }
  validates :body, presence: true, length: { maximum: 150 }
  validates :location, presence: true
end
