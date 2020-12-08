class CreateJoinTableDishesRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dishes, :restaurants do |t|
      # t.index [:dish_id, :restaurant_id]
      # t.index [:restaurant_id, :dish_id]
    end
  end
end
