class Dish < ApplicationRecord
  validates_presence_of :name, :taste
  belongs_to :restaurant

  def self.sort_by_spicy
    order(spicy: :desc)
  end

  def self.dish_count
    count
  end

  def self.is_it_spicy(dish)
    if dish.spicy == true
      p "Yes"
    else dish.spicy == false
      p "No"
    end
  end

  def self.order_alphabetically
    order(:name)
  end
end
