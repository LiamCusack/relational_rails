class RemoveNumOfShowsFromNetworks < ActiveRecord::Migration[5.2]
  def change
    remove_column :networks, :num_of_shows, :boolean
  end
end
