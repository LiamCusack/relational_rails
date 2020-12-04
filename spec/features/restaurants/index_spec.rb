require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the restaurant Index' do
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
    it 'the visitor sees the name of each restaurant record' do

      visit "/restaurants"

      expect(page).to have_content(@fazoli.name)
      expect(page).to have_content(@tacostar.name)
    end

    it 'I see a link to create a new restaurant record, "New Restaurant"' do
      visit "/restaurants"
      expect(page).to have_link('New Restaurant')
    end

  end
end
