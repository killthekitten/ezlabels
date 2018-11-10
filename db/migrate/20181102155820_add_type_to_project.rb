class AddTypeToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :type, :string, null: false
  end
end
