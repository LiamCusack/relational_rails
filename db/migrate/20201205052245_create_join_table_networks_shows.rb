class CreateJoinTableNetworksShows < ActiveRecord::Migration[5.2]
  def change
    create_join_table :networks, :shows do |t|
      t.index [:network_id, :show_id]
      t.index [:show_id, :network_id]
    end
  end
end
