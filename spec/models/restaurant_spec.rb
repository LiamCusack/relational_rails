require 'rails_helper'

describe Restaurant, type: :model do
  describe "validations" do
    it {should validate_presence_of :date_opened}
    it {should validate_presence_of :style}
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it { should have_many :dishes}
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
    @tacoplate = Dish.create({
      name: "Two Tacos with Rice and Beans",
      spicy: "False",
      taste: "Salty/Savory",
      restaurant_id: @tacostar.id
      })
  end

  describe 'class methods' do
    describe '::sort_by_date_desc' do
      it 'returns all restaurants ordered by opening date' do
        expect(Restaurant.sort_by_date_desc).to eq([@fazoli, @tacostar])
      end
    end
    describe '::order_by_dishes' do
      it 'returns all restaurants ordered by most dishes to least' do
        expect(Restaurant.order_by_dishes).to eq([@tacostar, @fazoli])
      end
    end
  end
end
