class NetworkShowsController < ApplicationController
  def index
    @network = Network.find(params[:id])
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
  
  # def destroy
  #   networks = Networks.find(params[:id])
  #   shows = Show.find(params[:id])
  #   Shows.destroy(params[:id])
  #   redirect_to "/shows"
  # end
  
  private 
  def show_params
    params.permit(:name, :daytime_show, :num_of_seasons)
  end
end 