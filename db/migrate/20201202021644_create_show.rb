class CreateShow < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.integer :id
      t.stringairtime :name
      t.integer :network_id
      t.boolean :daytime_show
    end
  end
end
