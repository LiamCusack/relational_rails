class Dish < ApplicationRecord
  validates_presence_of :name, :taste
  belongs_to :restaurant

end
