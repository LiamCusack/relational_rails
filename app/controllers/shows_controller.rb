class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def new

  end

  def create
    show = Show.new({
                    name: params[:name],
                    daytime_show: params[:daytime_show]
                  })
    show.save
    redirect_to '/shows'
  end

  def show
    @show = show.find(params[:id])
  end

  def edit
    @show = show.find(params[:id])
  end

  def update
    show = show.find(params[:id])
    show.update({
                    name: params[:name],
                    daytime_show: params[:daytime_show]
                  })
    show.save
    redirect_to "/shows/#{show.id}"
  end

  def destroy
    show.destroy(params[:id])
    redirect_to '/shows'
  end
end
