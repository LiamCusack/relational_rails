require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the shows show page' do
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
      @cartoon_network = Network.create!({
                      name: 'Cartoon Network',
                      established: '1992-10-01 11:00:00'
                  })
      @ricky_and_morty = Show.create!({
                      name: 'Rick and Morty',
                      daytime_show: true,
                      num_of_seasons: 4,
                      network_id: @cartoon_network.id
                  })
    end
    
    it "the visitor sees the show and their attributes" do
      visit "/shows/#{@bojack_horseman.id}"

      expect(page).to have_content(@bojack_horseman.name)
      expect(page).to have_content(@bojack_horseman.daytime_show)
    end
  end
end
