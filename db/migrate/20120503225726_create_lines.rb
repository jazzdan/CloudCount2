class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :budget_id
      t.integer :line_number
      t.string :name
      t.float :subtotal
      t.string :type
      t.integer :order

      t.timestamps
    end
  end
end
