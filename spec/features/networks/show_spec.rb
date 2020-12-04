require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the Networks Show Page' do
    before :each do
      @netflix = Network.create({
                          name: 'Netflix',
                          established: '1997-01-01 11:00:00',
                          num_of_shows: 3
                      })
      @cartoon_network = Network.create({
                          name: 'Cartoon Network',
                          established: '1992-01-01 01:00:00',
                          num_of_shows: 4
                      })
    end

    it 'the visitor sees the network with that ID including the networks attributes' do
      
      visit "/networks/#{@netflix.id}"

      expect(page).to have_content("#{@netflix.name}")
      expect(page).to have_content("#{@netflix.num_of_shows}")
    end

    it "the visitor sees a link to update the parent 'Update Network'" do
      visit "/networks/#{@netflix.id}"

      expect(page).to have_link('Update Network')

      click_link 'Update Network'

      visit "/networks/#{@netflix.id}/edit"
      fill_in "name", with: "Netflix Yoodle"
      fill_in "established", with: "1997-01-01 01:00:00"
      fill_in "num_of_shows", with: "4"
      
      click_button 'Update Network'

      visit "/networks/#{@netflix.id}"

      expect(page).to have_content("#{@netflix.name}")
      expect(page).to have_content("1997-01-01 01:00:00")
      expect(page).to have_content("4")
    end

    it "the visitor sees the delete Network link, clicks it, and deletes the Network along with all network's shows" do
      visit "/networks/#{@netflix.id}"

      expect(page).to have_link('Delete')

      visit "/restaurants"

      expect(page).to_not have_content("#{@netflix.name}")
      expect(page).to_not have_content("#{@netflix.established}")
      expect(page).to_not have_content("#{@netflix.num_of_shows}")
    end
  end  
end