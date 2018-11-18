class Product < ApplicationRecord
  validates :name, :description, :unit_price, :quantity, presence: :true
end
