require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the Show Index' do
    before :each do
          @netflix = Network.create({
                          name: 'Netflix',
                          established: '1997-01-01 11:00:00',
                          num_of_shows: 3
                      })
          @bojack_horseman = Show.create!({
                          name: 'Bojack Horseman',
                          daytime_show: true,
                          network_id: @netflix.id
                      })
    end

    it 'the visitor sees the name of each show' do
      
      visit '/shows'
      save_and_open_page
      expect(page).to have_content(@bojack_horseman.name)
      expect(page).to have_content(@bojack_horseman.daytime_show)
    end
  end  
end