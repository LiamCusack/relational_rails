require 'rails_helper'

describe Network, type: :model do
  before :each do
    @netflix = Network.create!({
      name: 'Netflix',
      established: '1997-01-01 11:00:00',
      num_of_shows: 2
      })
    @bojack_horseman = Show.create!({
      name: 'Bojack Horseman',
      daytime_show: true,
      num_of_seasons: 6,
      network_id: @netflix.id
      })
        @cannon_busters = Show.create!({
          name: 'Cannon Busters',
          daytime_show: true,
          num_of_seasons: 1,
          network_id: @netflix.id
          })
          @cartoon_network = Network.create!({
            name: 'Cartoon Network',
            established: '1992-10-01 11:00:00',
            num_of_shows: 1
            })
            @ricky_and_morty = Show.create!({
              name: 'Rick and Morty',
              daytime_show: true,
              num_of_seasons: 4,
              network_id: @cartoon_network.id
              })
    end
            
  describe "validations" do
    it {should validate_presence_of :name}
    end
  end

  describe "relationships" do
    it {should have_many :shows}
    end
  end
  
  # it "Knows count of shows" do
  #   expect(@netflix.shows_count).to eq(1)
  # end
# end