class RemoveDepartmentFromEmployee < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :department, :string
  end
end
