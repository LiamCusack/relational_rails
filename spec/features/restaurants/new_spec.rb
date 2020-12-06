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
    describe 'I fill in the forms for a new restaurant record and click submit' do
      describe 'A post request is sent to the /restaurant route, a new restaurant record is created' do
        it ' I am redirected to the index page when I see the new restaurant' do

          visit '/restaurants/new'

          fill_in "name", with: "Cosmo's"
          fill_in "date_opened", with: "2222-02-02 22:22:22"
          fill_in "style", with: "Pizza"
          click_button("Create Restaurant")

          visit '/restaurants'
          expect(page).to have_content("Cosmo's")
        end
      end
    end
  end
end
