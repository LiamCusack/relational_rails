require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a restaurants dish index' do
    describe "I see each dish that is associated with that restaurant" do
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

      it "that dishes attributes" do

        visit "/restaurants/#{@fazoli.id}/dishes"

        expect(page).to have_content(@pizza.name)
        expect(page).to have_content(Dish.is_it_spicy(@pizza))
        expect(page).to have_content(@pizza.taste)
      end
    end
  end
end
