class CreateRestaurant < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :id
      t.string :name
      t.datetime :date_opened
      t.string :style
    end
  end
end
