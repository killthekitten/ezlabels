class AddPicturesPictureClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_classes_pictures do |t|
      t.integer :picture_id
      t.integer :picture_class_id
    end
  end
end
