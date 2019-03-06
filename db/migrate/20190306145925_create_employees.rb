class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :role
      t.string :department
      t.string :company
      t.datetime :admission_date

      t.timestamps
    end
  end
end
