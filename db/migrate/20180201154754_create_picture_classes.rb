class CreatePictureClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_classes do |t|
      t.references :project, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
