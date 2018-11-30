class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  mount_uploader :image, ImageUploader
end
