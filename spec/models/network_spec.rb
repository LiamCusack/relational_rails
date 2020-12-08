require 'rails_helper'

describe Network, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :shows}
  end
  
  before :each do
    @netflix = Network.create!({
                                name: 'Netflix',
                                established: '1997-01-01 11:00:00'
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
  end

  it "Knows count of shows" do
    
    expect(@netflix.shows_count).to eq(2)
  end
end