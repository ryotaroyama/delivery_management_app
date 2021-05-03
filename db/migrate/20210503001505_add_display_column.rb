class AddDisplayColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :display, :boolean, default: true, null: false
  end
end
