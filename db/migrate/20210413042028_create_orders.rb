class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :delivery_date, null: false
      t.string :process, null: false
      t.string :comment
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :processor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
