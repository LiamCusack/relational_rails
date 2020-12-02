class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :network_id
      t.boolean :daytime_show
    end
  end
end
