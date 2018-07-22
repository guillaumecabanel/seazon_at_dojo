class Meal < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true

  has_many :servings
end
