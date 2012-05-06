class AddLineDefaults < ActiveRecord::Migration
  def change

    change_column :lines, :budget_id, :integer, default: 0
    change_column :lines, :line_number, :integer, default: 0
    change_column :lines, :subtotal, :float, default: 0
    change_column :lines, :order, :integer, default: 0
  end
end
