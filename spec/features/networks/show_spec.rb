require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the Networks ID' do
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
  end  
end