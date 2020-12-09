require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a restaurants dish index' do
    before :each do
      @fazoli = Restaurant.create({
        name: "Fazoli's",
        date_opened: "1593-02-24 11:11:11",
        style: "Italian"
        })

      @pizza = Dish.create({
        name: "Pizza",
        spicy: "False",
        taste: "Salty/Savory",
        restaurant_id: @fazoli.id
        })
    end
    describe "I see each dish that is associated with that restaurant" do
      it "that dishes attributes" do

        visit "/restaurants/#{@fazoli.id}/dishes"

        expect(page).to have_content(@pizza.name)
        expect(page).to have_content("No")
        expect(page).to have_content(@pizza.taste)
      end
    end
    describe "I see a link to add a new dish for that restaurant" do
      it "I click that link" do

        visit "/restaurants/#{@fazoli.id}/dishes"
        expect(page).to have_link('Add Dish')
        click_link("Add Dish")
        visit "/restaurants/#{@fazoli.id}/dishes/new"

        fill_in "name", with: "Pie"
        fill_in "taste", with: "sweet"
        click_button("Create Dish")

        visit "/restaurants/#{@fazoli.id}/dishes"
        expect(page).to have_content("Pie")
        expect(page).to have_content("No")
        expect(page).to have_content("sweet")
      end
    end
  end
end
