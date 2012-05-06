class AddTransactionDefaults < ActiveRecord::Migration
  def change
    change_column :transactions, :budget_id, :integer, default: 0
    change_column :transactions, :subline_id, :integer, default: 0
    change_column :transactions, :subtotal, :float, default: 0
    change_column :transactions, :order, :integer, default: 0
    change_column :transactions, :user_id, :integer, default: 0
  end
end
