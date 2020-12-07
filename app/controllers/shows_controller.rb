class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def new
    @show = Show.find(params[:id])
  end

  def create
    show = Show.new({
                    name: params[:name],
                    daytime_show: params[:daytime_show],
                    num_of_seasons: params[:num_of_seasons]
                  })
    show.save
    redirect_to '/shows'
  end

  def show
    @show = Show.find(params[:id])
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    show = Show.find(params[:id])
    show.update({
                    name: params[:name],
                    daytime_show: params[:daytime_show],
                    num_of_seasons: params[:num_of_seasons]
                  })
    show.save
    redirect_to "/shows/#{show.id}"
  end

  def destroy
    Show.destroy(params[:id])
    redirect_to '/shows'
  end
end
