require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the dishes index' do
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

      @pizza = Dish.create({
        name: "Pizza",
        spicy: "False",
        taste: "Salty/Savory",
        restaurant_id: @fazoli.id
        })
      @gcburrito = Dish.create({
        name: "Burrito with green chili",
        spicy: "True",
        taste: "Salty/Savory/Sour",
        restaurant_id: @tacostar.id
        })
    end
    it 'the visitor sees the name of each dish record' do

      visit "/dishes"

      expect(page).to have_content(@pizza.name)
      expect(page).to have_content(@gcburrito.name)
    end
  end
end
