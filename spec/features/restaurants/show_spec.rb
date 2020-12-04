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
  end
end
