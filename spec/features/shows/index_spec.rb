require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the Show Index' do
    before :each do
          @netflix = Network.create({
                          name: 'Netflix',
                          established: '1997-01-01 11:00:00',
                          num_of_shows: 3
                      })
          @bojack_horseman = Show.create({
                          name: 'Bojack Horseman',
                          daytime_show: true
                      })
    end

    it 'the visitor sees the name of each show' do
      
      visit '/shows'

      expect(page).to have_content(@bojack_horseman.name)
    end

    it "the visitor sees a link to create a new Parent record, 'New Parent'" do
       visit "/networks/#{@netflix.id}/shows"
       expect(page).to have_content(@bojack_horseman.name)
    end
  end  
end