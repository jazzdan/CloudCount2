class Line < ActiveRecord::Base
    attr_accessible :category, :budget_id, :line_number, :name, :subtotal, :order

    CATEGORIES = ['incomes', 'expenses']

    belongs_to :budget

    has_many :sublines, :dependent => :destroy

    audited

    def budget_total
        if @budget_total.nil?
            @budget_total = self.sublines.reduce(0) do |sum, subline|
                sum + subline.subtotal
            end
        end
        @budget_total
    end

    def actual
        if @actual_total.nil?
            @actual_total = self.sublines.reduce(0) do |sum, subline|
                sum + subline.actual
            end
        end
        @actual_total
    end

end
