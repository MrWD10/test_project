class Task < ApplicationRecord
  mount_uploader :img, ImageUploader
  belongs_to :business
  has_many :users, through: :businesses
end
