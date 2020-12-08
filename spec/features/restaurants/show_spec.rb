require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the restaurant id page' do
    before :each do
      @fazoli = Restaurant.create({
                                  name: "Fazoli's",
                                  date_opened: "1593-02-24 11:11:11",
                                  style: "Italian"
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

      fill_in "name", with: "Cosmo's"
      fill_in "date_opened", with: "2222-02-02 22:22:22"
      fill_in "style", with: "Pizza"

      click_button("Update")

      visit "/restaurants/#{@fazoli.id}"

      expect(page).to have_content("Cosmo's")
      expect(page).to have_content("2222-02-02 22:22:22")
      expect(page).to have_content("Pizza")

    end

    it "I see a link to delete each restaurant that will return me to the restaurant index" do
      visit "/restaurants/#{@fazoli.id}"

      expect(page).to have_link("Delete Restaurant")

      click_link("Delete Restaurant")

      visit "/restaurants"

      expect(page).to_not have_content("Fazoli's")
      expect(page).to_not have_content("1593-02-24 11:11:11")
      expect(page).to_not have_content("Italian")
    end
  end
end
