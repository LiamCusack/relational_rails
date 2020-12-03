class NetworksController < ApplicationController
  def index
    @networks = Network.all
  end

  def create
    network = Network.new({
                           name: params[:network][:name],
                           established: params[:network][:established],
                           num_of_shows: params[:network][:num_of_shows]
                        })
    network.save
    redirect_to '/networks'
  end
end