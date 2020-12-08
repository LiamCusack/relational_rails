require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the dish id page' do
    before :each do
      @fazoli = Restaurant.create({
        name: "Fazoli's",
        date_opened: "1593-02-24 11:11:11",
        style: "Italian"
        })

      @pizza = Dish.create!({
        name: "Pizza",
        spicy: false,
        taste: "Salty/Savory",
        restaurant_id: @fazoli.id
        })
      end
    it 'the visitor sees the attributes of the dish with that id' do

      visit "/dishes/#{@pizza.id}"

      expect(page).to have_content("Pizza")
      expect(page).to have_content("false")
      expect(page).to have_content("Salty/Savory")
    end

    it 'the visitor sees a link that lets them update a dish and then return to the dish id page' do

      visit "/dishes/#{@pizza.id}"

      expect(page).to have_link("Update Dish")

      click_link("Update Dish")

      visit "/dishes/#{@pizza.id}/edit"

      fill_in "name", with: "Calzone"
      fill_in "taste", with: "Calzoney"

      click_button("Update Dish")

      visit "/dishes/#{@pizza.id}"

      expect(page).to have_content("Calzone")
      expect(page).to have_content("false")
      expect(page).to have_content("Calzoney")
    end

    it "I see a link to delete each restaurant that will return me to the index page" do
      visit "/dishes/#{@pizza.id}"

      expect(page).to have_link("Delete")

      click_link("Delete")

      visit "/dishes"

      expect(page).to_not have_content("Pizza")
      expect(page).to_not have_content("false")
      expect(page).to_not have_content("Salty/Savory")
    end
  end
end
