require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the restaurant id page' do
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
    it 'the visitor sees the attributes of each restaurant with that id' do

      visit "/restaurants/#{@fazoli.id}"

      expect(page).to have_content("#{@fazoli.name}")
      expect(page).to have_content("#{@fazoli.date_opened}")
      expect(page).to have_content("#{@fazoli.style}")
    end

    it 'Then I see a "update restaurant" link to update the restaurant' do
      visit "/restaurants/#{@fazoli.id}"

      expect(page).to have_link('Update Restaurant')

      click_link("Update Restaurant")

      visit "/restaurants/#{@fazoli.id}/edit"

      fill_in "Restaurant Name:", with: "Cosmo's"
      fill_in "Date Opened:", with: "2222-02-02 22:22:22"
      fill_in "Style:", with: "Pizza"

      click_button("Update")

      visit "/restaurants/#{@fazoli.id}"

      expect(page).to have_content("#{@fazoli.name}")
      expect(page).to have_content("#{@fazoli.date_opened}")
      expect(page).to have_content("#{@fazoli.style}")

    end

    it "words" do
      visit "/restaurants/#{@fazoli.id}"

      expect(page).to have_link("Delete")

      click_link("Delete")

      visit "/restaurants"

      expect(page).to_not have_content("#{@fazoli.name}")
      expect(page).to_not have_content("#{@fazoli.date_opened}")
      expect(page).to_not have_content("#{@fazoli.style}")
    end
  end
end
