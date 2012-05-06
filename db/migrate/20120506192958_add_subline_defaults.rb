class AddSublineDefaults < ActiveRecord::Migration
  def change
    change_column :sublines, :line_id, :integer, default: 0
    change_column :sublines, :line_number, :integer, default: 0
    change_column :sublines, :subtotal, :float, default: 0
    change_column :sublines, :order, :integer, default: 0
  end
end
