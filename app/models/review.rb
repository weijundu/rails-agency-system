class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  validates :content, length: { minimum: 20 }
end
