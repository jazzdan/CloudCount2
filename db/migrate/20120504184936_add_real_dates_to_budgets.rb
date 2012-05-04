class AddRealDatesToBudgets < ActiveRecord::Migration
    def change
        change_column :budgets, :starts, :datetime
        change_column :budgets, :ends, :datetime
    end
end
