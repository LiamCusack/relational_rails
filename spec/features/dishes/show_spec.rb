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
  end
end
