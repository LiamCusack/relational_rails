class NetworkShowsController < ApplicationController
  def index
    @network = Network.find(params[:id])
    @shows = @network.shows.order_by_alpha if params[:sort] || 
    @shows = @network.shows.true_before_false
  end

  def new
    @network = Network.find(params[:id])
  end

  def create
    networks = Network.find(params[:id])
    networks.shows.create!(show_params)
    redirect_to "/networks/#{networks.id}/shows"
  end
  
  private 
  def show_params
    params.permit(:name, :daytime_show, :num_of_seasons)
  end
end 