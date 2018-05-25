class Review < ApplicationRecord
  belongs_to :profile
  validates :content, length: { minimum: 20 }
end
