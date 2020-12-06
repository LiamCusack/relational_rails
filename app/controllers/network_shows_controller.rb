class NetworkShowsController < ApplicationController
  def index
    @network = Network.find(params[:id])
  end

  # def new
  #   @networks = Networks.find(params[:id])
  # end

  # def create
  #   networks = Networks.find(params[:id])
  #   networks.shows.create!(shows_params)
  #   redirect_to "/networks/#{networks.id}/shows"
  # end

  # def destroy
  #   networks = Networks.find(params[:id])
  #   shows = Show.find(params[:id])
  #   Shows.destroy(params[:id])
  #   redirect_to "/shows"
  # end
end 