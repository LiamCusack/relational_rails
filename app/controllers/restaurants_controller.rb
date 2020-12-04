class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new

  end

  def create
    restaurant = Restaurant.new({
                                name: params[:restaurant][:name],
                                date_opened: params[:restaurant][:date_opened],
                                style: params[:restaurant][:style]
                                })
      restaurant.save
      redirect_to '/restaurants'
    end

    def show
      @restaurant = Restaurant.find(params[:id])
    end

    def edit
      @restaurant = Restaurant.find(params[:id])
    end

    def update
      restaurant = Restaurant.find(params[:id])
      restaurant.update({
                        name: params[:restaurant][:name],
                        date_opened: params[:restaurant][:date_opened],
                        style: params[:restaurant][:style]
                        })
        restaurant.save
        redirect_to "/restaurants/#{restaurant.id}"
    end

    def destroy
      Restaurant.destroy(params[:id])
      redirect_to '/restaurants'
    end
end
