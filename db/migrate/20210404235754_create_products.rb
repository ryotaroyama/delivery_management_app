class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :process, null: false
      t.date :delivery_date, null: false
      t.string :drawing_number
      t.string :comment
      t.references :customer, null: false, foreign_key: true
      t.references :processor, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :drawing_number, unique: true
  end
end
