class CreateNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :networks do |t|
      t.string :name
      t.datetime :established
      t.integer :num_of_shows
    end
  end
end
