class AddProjectToPicture < ActiveRecord::Migration[5.2]
  def change
    add_reference :pictures, :project, null: false
  end
end
