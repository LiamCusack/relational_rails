class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order(date_opened: :desc)
  end


  def new
  end

  def create
    restaurant = Restaurant.new({
                                name: params[:name],
                                date_opened: params[:date_opened],
                                style: params[:style]
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
                        name: params[:name],
                        date_opened: params[:date_opened],
                        style: params[:style]
                        })
        restaurant.save
        redirect_to "/restaurants/#{restaurant.id}"
    end

    def destroy
      Restaurant.destroy(params[:id])
      redirect_to '/restaurants'
    end
end
