class Line < ActiveRecord::Base
    attr_accessible :category, :budget_id, :line_number, :name, :subtotal, :order

    CATEGORIES = ['incomes', 'expenses']

    belongs_to :budget

    has_many :sublines

    audited

    def actual
        return 0.00
    end

end
