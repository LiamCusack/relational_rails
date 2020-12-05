class Dish < ApplicationRecord
  validates_presence_of :name, :spicy, :taste
  belongs_to :restaurant
end
