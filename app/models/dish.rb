class Dish < ApplicationRecord
  validates_presence_of :name, :taste
  belongs_to :restaurant

  def self.sort_by_spicy
    order(spicy: :desc)
  end

  def self.dishes_count(restaurant)
    where(restaurant_id: restaurant).count
  end
end
