class RestaurantDishesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    if params[:sort]
      @dishes = @restaurant.dishes.order_alphabetically
    else
      @dishes = @restaurant.dishes
    end
  end

  # def show
  #   @restaurant = Restaurant.find(params[:id])
  # end

  def new
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:id])
    @restaurant.dishes.create!({
                    name: params[:name],
                    spicy: params[:spicy],
                    taste: params[:taste]
                    })
      redirect_to "/restaurants/#{@restaurant.id}/dishes"
  end
end
