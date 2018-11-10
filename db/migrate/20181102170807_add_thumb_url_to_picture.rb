class AddThumbUrlToPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :thumb_url, :string
  end
end
