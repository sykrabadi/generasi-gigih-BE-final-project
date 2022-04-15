class Food < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than: 0.01}
end
