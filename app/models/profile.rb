class Profile < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :contracts
  mount_uploader :image, PhotoUploader
end
