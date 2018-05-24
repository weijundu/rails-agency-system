class Profile < ApplicationRecord
  belongs_to :user
  has_many :contracts
  mount_uploader :image, PhotoUploader
end
