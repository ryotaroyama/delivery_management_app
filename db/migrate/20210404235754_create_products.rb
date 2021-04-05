class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.enum :process
      t.date :delivery_date
      t.string :drawing_number
      t.string :comment

      t.timestamps
    end
  end
end
