class NetworkShowsController < ApplicationController
  def index
    @network_shows = NetworkShow.all
  end

  def new
    
  end
end 