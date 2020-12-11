class RemoveNumOfEmployeesFromNetworks < ActiveRecord::Migration[5.2]
  def change
    remove_column :networks, :num_of_employees, :integer
  end
end
