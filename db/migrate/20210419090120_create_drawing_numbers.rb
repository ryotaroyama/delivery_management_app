class CreateDrawingNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :drawing_numbers do |t|
      t.integer :name

      t.timestamps
    end
    add_index :drawing_numbers, :name, unique: true
  end
end
