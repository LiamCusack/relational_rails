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

    it "the visitor is taken to edit page and completes process to edit Network" do
      visit "/networks/#{@netflix.id}/edit"

      fill_in "#{@netflix.name}", with: "Lifetime Network"
      # fill_in "Date Established:", with: "1984-01-01 01:00:00"
      # fill_in "Num of Shows:", with: 2
      click_button 'Submit'

    end
  end  
end