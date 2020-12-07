require 'rails_helper'

describe Network, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :shows}
    end
  end

  it "Knows count of shows" do
    netflix = Network.create!({
                    name: 'Netflix',
                    established: '1997-01-01 11:00:00',
                    num_of_shows: 2
                })
    bojack_horseman = Show.create!({
                    name: 'Bojack Horseman',
                    daytime_show: true,
                    num_of_seasons: 6,
                    network_id: @netflix.id
                })
    

  expect(netflix.shows_count).to eq(1)
  end