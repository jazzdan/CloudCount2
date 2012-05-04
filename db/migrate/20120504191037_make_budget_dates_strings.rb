class MakeBudgetDatesStrings < ActiveRecord::Migration
    def change
        change_column :budgets, :starts, :string
        change_column :budgets, :ends, :string
    end
end
