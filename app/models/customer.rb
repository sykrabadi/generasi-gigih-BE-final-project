class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
end
