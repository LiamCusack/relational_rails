require 'rails_helper'

describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :taste}
  end
  describe 'relationships' do
    it { should belong_to :restaurant}
  end

  before :each do
    @fazoli = Restaurant.create({
      name: "Fazoli's",
      date_opened: "1593-02-24 11:11:11",
      style: "Italian"
      })
    @tacostar = Restaurant.create({
      name: "Taco Star",
      date_opened: "1592-02-24 11:11:11",
      style: "Mexican"
      })

    @pizza = Dish.create({
      name: "Pizza",
      spicy: false,
      taste: "Salty/Savory",
      restaurant_id: @fazoli.id
      })
    @gcburrito = Dish.create({
      name: "Burrito with green chili",
      spicy: true,
      taste: "Salty/Savory/Sour",
      restaurant_id: @tacostar.id
      })
    @tacoplate = Dish.create({
      name: "Two Tacos with Rice and Beans",
      spicy: false,
      taste: "Salty/Savory",
      restaurant_id: @tacostar.id
      })
  end

  describe 'class methods' do
    describe '::sort_by_spicy' do
      it 'sorts dishes with spicy ones listed first' do
        expect(Dish.sort_by_spicy).to eq([@gcburrito, @pizza, @tacoplate])
      end

      describe '::dish_count' do
        it 'shows total number of dishes' do
          expect(Dish.dish_count).to eq(3)
        end
      end

      describe '::is_it_spicy' do
        it 'tells us if a dish is spicy or not' do
          expect(Dish.is_it_spicy(@pizza)).to eq("No")
          expect(Dish.is_it_spicy(@gcburrito)).to eq("Yes")
          expect(Dish.is_it_spicy(@tacoplate)).to eq("No")
        end
      end

      describe '::order_alphabetically' do
        it 'sorts dishes alphabetically' do
          expect(Dish.order_alphabetically).to eq([@gcburrito, @pizza, @tacoplate])
        end
      end
    end
  end
end
