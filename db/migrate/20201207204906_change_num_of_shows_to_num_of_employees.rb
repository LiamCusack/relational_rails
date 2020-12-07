class ChangeNumOfShowsToNumOfEmployees < ActiveRecord::Migration[5.2]
  def change
    rename_column :networks, :num_of_shows, :num_of_employees
  end
end
