class MakePictureRejectedNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :pictures, :rejected, false
  end
end
