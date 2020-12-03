class NetworksController < ApplicationController
  def index
    @networks = Network.all
  end

  def new
    
  end

  def create
    require 'pry'; binding.pry
    network = Network.new({
                           name: params[:network][:name],
                           established: params[:network][:established],
                           num_of_shows: params[:network][:num_of_shows]
                        })
    require 'pry'; binding.pry
    network.save
    require 'pry'; binding.pry
    redirect_to '/networks'
  end

  def show
    @network = Network.find(params[:id])
  end
end