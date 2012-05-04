class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :lines, :type, :category
    rename_column :sublines, :type, :category
  end
end
