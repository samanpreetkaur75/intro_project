class Breed < ApplicationRecord
  has_many :images, dependent: :destroy
  validates :name, presence: true
end
