class AddNumOfEmployeesToNetworks < ActiveRecord::Migration[5.2]
  def change
    add_column :networks, :num_of_employees, :integer
  end
end
