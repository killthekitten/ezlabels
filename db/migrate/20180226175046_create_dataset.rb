class CreateDataset < ActiveRecord::Migration[5.2]
  def change
    create_table :datasets do |t|
      t.string :name, null: false
      t.string :data_type, null: false
    end
  end
end
