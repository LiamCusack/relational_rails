require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the Show Index' do
    before :each do
          @netflix = Network.create({
                          name: 'Netflix',
                          established: '1997-01-01 11:00:00'
                      })
          @bojack_horseman = Show.create!({
                          name: 'Bojack Horseman',
                          daytime_show: true,
                          num_of_seasons: 6,
                          network_id: @netflix.id
                      })
    end
    # User Story 8
    it 'the visitor sees the name of each show' do
      visit "/shows/#{@bojack_horseman.id}"

      expect(page).to have_content(@bojack_horseman.name)
      expect(page).to have_content(@bojack_horseman.daytime_show)
      expect(page).to have_content(@bojack_horseman.num_of_seasons)
    end

    # User Story 10
    it 'the visitor sees a link to update that show "Update Child"' do
      visit "/shows/#{@bojack_horseman.id}"
      
      expect(page).to have_link("Update Show")
      click_link('Update Show')

      visit "/shows/#{@bojack_horseman.id}/edit"

      fill_in "Number of Seasons:", with: 7
      click_on('Submit Update')

      visit "/shows/#{@bojack_horseman.id}"

      expect(page).to have_content(7)
    end

    # User Story 11
    it '`the visitor sees a link to delete the show and once clicked show is deleted`' do
      visit "/shows/#{@bojack_horseman.id}"

      expect(page).to have_link('Delete Show')
      click_on('Delete Show')

      visit "/shows"

      expect(page).to_not have_content("#{@bojack_horseman.name}")
      expect(page).to_not have_content("#{@bojack_horseman.daytime_show}")
      expect(page).to_not have_content("#{@bojack_horseman.num_of_seasons}")
    end

    # User Story 14
    it 'I see the records that have a `true` above/before the records that have a false' do
      visit '/shows'
          
    end
  end  
end