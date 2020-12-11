class AddNumOfSeasonsToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :num_of_seasons, :integer
  end
end
