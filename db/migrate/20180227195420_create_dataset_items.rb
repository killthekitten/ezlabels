class CreateDatasetItems < ActiveRecord::Migration[5.2]
  def change
    create_table :dataset_items do |t|
      t.text :url, null: false
      t.belongs_to :dataset, index: true, null: false

      t.timestamps
    end

    remove_column :labels, :url, :string
  end
end
