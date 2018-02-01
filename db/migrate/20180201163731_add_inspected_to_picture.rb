class AddInspectedToPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :inspected, :boolean, null: false, default: false
  end
end
