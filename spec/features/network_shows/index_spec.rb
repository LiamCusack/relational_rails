require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the networks show index' do
    before :each do
      @netflix = Network.create!({
                      name: 'Netflix',
                      established: '1997-01-01 11:00:00',
                      num_of_shows: 2
                  })
      @bojack_horseman = Show.create!({
                      name: 'Bojack Horseman',
                      daytime_show: true,
                      network_id: @netflix.id
                  })
      
      @cannon_busters = Show.create!({
                      name: 'Cannon Busters',
                      daytime_show: true,
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
                      network_id: @cartoon_network.id
                  })
    end
    
    it "the visitor sees each show and their attributes that is associated with that network" do
      visit "/networks/#{@netflix.id}/shows"
      expect(page).to have_content(@bojack_horseman.name)
      expect(page).to have_content(@cannon_busters.name)
    end
  end
end
