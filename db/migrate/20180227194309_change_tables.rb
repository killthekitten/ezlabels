class ChangeTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :pictures, :labels
    rename_table :picture_classes, :label_classes
    rename_table :picture_classes_pictures, :label_classes_project_labels
    rename_column :labels, :picture_class_id, :label_class_id
    rename_column :label_classes_project_labels, :picture_id, :label_id
    rename_column :label_classes_project_labels, :picture_class_id, :label_class_id
  end
end
