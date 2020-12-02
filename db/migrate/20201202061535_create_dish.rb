class CreateDish < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.integer :id
      t.string :name
      t.boolean :spicy
      t.string :taste
      t.integer :restaurant_id
    end
  end
end
