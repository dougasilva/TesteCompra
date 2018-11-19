class Product < ApplicationRecord
  has_many :items
  has_many :orders, through: :items
  validates :name, :description, :unit_price, :quantity, presence: :true
end
