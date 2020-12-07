require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the networks show index page' do
    before :each do
      @netflix = Network.create!({
                      name: 'Netflix',
                      established: '1997-01-01 11:00:00',
                      num_of_employees: 2
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
                      num_of_employees: 1
                  })
      @ricky_and_morty = Show.create!({
                      name: 'Rick and Morty',
                      daytime_show: true,
                      num_of_seasons: 4,
                      network_id: @cartoon_network.id
                  })
    end
    # User Story 7
    it "the visitor sees each show and their attributes that is associated with that network" do
      visit "/networks/#{@netflix.id}/shows"
      
      expect(page).to have_content(@bojack_horseman.name)
      expect(page).to have_content(@cannon_busters.name)

      visit "/networks/#{@cartoon_network.id}/shows"
      
      expect(page).to have_content(@ricky_and_morty.name)
      expect(page).to_not have_content(@cannon_busters.name)
    end
    # User Story 9
    it 'the visitor sees a link to create new show for that network clicks the link, fills in form, and new show is created' do
      visit "/networks/#{@netflix.id}/shows"

      expect(page).to have_link('Create Show')  

      visit "/networks/#{@netflix.id}/shows/new"

      fill_in "Name", with: "Cannon Buster"
      fill_in "Number of Seasons:", with: 1
      check "Daytime Show?"
      click_button 'Create Show'

      visit "/networks/#{@netflix.id}/shows"

      expect(page).to have_content('Cannon Busters')
    end
  end
end
