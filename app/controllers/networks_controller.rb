class NetworksController < ApplicationController

  def index
    @networks = Network.all
  end

  def new

  end

  def create
    network = Network.new({
                            name: params[:name],
                            established: params[:established],
                            num_of_shows: params[:num_of_shows]
                          })
    network.save
    redirect_to '/networks'
  end

  def show
    @network = Network.find(params[:id])
  end

  def edit
    @network = Network.find(params[:id])
  end

  def update
    network = Network.find(params[:id])
    network.update({
                    name: params[:name],
                    established: params[:established],
                    num_of_shows: params[:num_of_shows]
                  })
    network.save
    redirect_to "/networks/#{network.id}"
  end

  def destroy
    Network.destroy(params[:id])
    redirect_to '/networks'
  end
end
