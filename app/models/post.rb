class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 25 }
  validates :body, presence: true, length: { maximum: 150 }
  validates :location, presence: true
end
