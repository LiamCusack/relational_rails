class DropNetworksShows < ActiveRecord::Migration[5.2]
  def change
    drop_table :networks_shows do |t|
      t.index [:network_id, :show_id]
      t.index [:show_id, :network_id]
    end
  end
end
