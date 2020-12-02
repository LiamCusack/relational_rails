class CreateNetwork < ActiveRecord::Migration[5.2]
  def change
    create_table :networks do |t|
      t.integer :id
      t.string :name
      t.datetime :established
    end
  end
end
