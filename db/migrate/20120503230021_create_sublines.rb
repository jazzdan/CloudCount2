class CreateSublines < ActiveRecord::Migration
  def change
    create_table :sublines do |t|
      t.integer :line_id
      t.integer :line_number
      t.string :name
      t.float :subtotal
      t.string :type
      t.integer :order

      t.timestamps
    end
  end
end
