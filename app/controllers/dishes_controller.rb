class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def new

  end

  def create
    dish = Dish.new({
                                name: params[:dish][:name],
                                spicy: params[:dish][:spicy],
                                taste: params[:dish][:taste]
                                })
      dish.save
      redirect_to '/dishes'
    end

    def show
      @dish = Dish.find(params[:id])
    end

    def edit
      @dish = Dish.find(params[:id])
    end

    def update
      dish = Dish.find(params[:id])
      dish.update({
                        name: params[:dish][:name],
                        spicy: params[:dish][:spicy],
                        taste: params[:dish][:taste]
                        })
        dish.save
        redirect_to "/dishes/#{dish.id}"
    end

    def destroy
      Dish.destroy(params[:id])
      redirect_to '/dishes'
    end
end
