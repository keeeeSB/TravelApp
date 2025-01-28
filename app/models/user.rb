class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :Confirmable

  mount_uploader :profile_image, ProfileImageUploader
end
