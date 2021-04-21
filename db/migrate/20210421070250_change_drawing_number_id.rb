class ChangeDrawingNumberId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :drawing_number_id, true
    change_column_null :drawing_numbers, :name, false
  end
end
