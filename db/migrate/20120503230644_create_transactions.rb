class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :budget_id
      t.integer :subline_id
      t.string :name
      t.float :subtotal
      t.integer :order
      t.integer :user_id

      t.timestamps
    end
  end
end
