require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the Networks New Page' do
    before :each do
      @netflix = Network.create({
                          name: 'Netflix',
                          established: '1997-01-01 11:00:00',
                          num_of_employees: 3
                      })
      @cartoon_network = Network.create({
                          name: 'Cartoon Network',
                          established: '1992-01-01 01:00:00',
                          num_of_employees: 4
                      })
    end

    it "the visitor fills in a form for a new Network record and clicks the Create Network button" do
      visit '/networks/new'
      fill_in "Name", with: "Lifetime"
      fill_in "Established", with: "1984-01-01 01:00:00"
      fill_in "Num of Employees", with: 2
      click_button 'Create Network'
      visit '/networks'
      expect(page).to have_content('Lifetime')
    end
  end  
end