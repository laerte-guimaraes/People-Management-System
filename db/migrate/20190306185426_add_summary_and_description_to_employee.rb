class AddSummaryAndDescriptionToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :summary, :text
    add_column :employees, :description, :text
  end
end
