class NetworksController < ApplicationController

  def index
    @networks = Network.all.most_recent
    @networks = Network.order_by_shows if params[:sort] ||
    @networks = Network.all.most_recent
  end

  def new
  end

  def create
    network = Network.new({
                            name: params[:name],
                            established: params[:established]
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
                    established: params[:established]
                  })
    network.save
    redirect_to "/networks/#{network.id}"
  end

  def destroy
    Network.destroy(params[:id])
    redirect_to '/networks'
  end
end
