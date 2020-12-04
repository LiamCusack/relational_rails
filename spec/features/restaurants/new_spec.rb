require 'rails_helper'

describe 'When I click the New Restaurant link' do
  describe 'I am brought to a page where I see a new form' do
    before :each do
      @fazoli = Restaurant.create({
                                  name: "Fazoli's",
                                  date_opened: "1593-02-24 11:11:11",
                                  style: "Italian"
                                  })
      @tacostar = Restaurant.create({
                                  name: "Taco Star",
                                  date_opened: "1593-02-24 11:11:11",
                                  style: "Mexican"
                                  })

      end

    it 'I fill in the forms for a new restaurant record and click submit' do

      visit '/restaurants/new'

      fill_in "Restaurant Name:", with: "Cosmo's"
      fill_in "Date Opened:", with: "2222-02-02 22:22:22"
      fill_in "Style:", with: "Pizza"
      click_button("Create Restaurant")
    end
  end
end
