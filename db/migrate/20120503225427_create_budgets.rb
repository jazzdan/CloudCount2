class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :title
      t.string :description
      t.integer :starts
      t.integer :ends
      t.string :rolls

      t.timestamps
    end
  end
end
