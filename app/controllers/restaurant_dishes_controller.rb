class RestaurantDishesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
  end

  def show
    @restaurant = Dish.find(params[:id])
  end

  def new

  end

  def create
    dish = Dish.new({
                    name: params[:name],
                    spicy: params[:spicy],
                    taste: params[:taste]
                    })
      dish.save
      redirect_to "/restaurants/:id/dishes"
  end
end
