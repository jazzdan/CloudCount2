class Budget < ActiveRecord::Base

    has_many :notes, :order => "created_at DESC", :dependent => :destroy

    has_many :lines, :dependent => :destroy

    has_many :incomes, :class_name => "Line",
        :conditions => { :category => 'incomes' },
        :order => 'line_number ASC'

    has_many :expenses, :class_name => "Line",
        :conditions => { :category => 'expenses' },
        :order => 'line_number ASC'

    has_many :attachments, :order => 'created_at DESC', :dependent => :destroy

    audited

    ROLLS = ['daily', 'weekly', 'monthly', 'quarterly', 'yearly']

    def budget
        if @budget_total.nil?
            @budget_total = self.lines.reduce(0) do |sum, lines|
                sum + lines.subtotal
            end
        end
        @budget_total
    end

    def actual
        if @actual.nil?
            @actual = self.lines.reduce(0) do |sum, lines|
                sum + lines.actual
            end
        end
        @actual
    end

    def excess
        self.budget - self.actual
    end

    def category_balanced(cat)
        self.category_actual(cat) <= self.category_budget(cat)
    end

    def category_budget(cat)
        self.lines.reduce(0) do |sum, line|
            if line.category == cat
                sum + line.subtotal
            else
                sum
            end
        end
    end

    def category_actual(cat)
        self.lines.reduce(0) do |sum, line|
            if line.category == cat
                sum + line.actual
            else
                sum
            end
        end
    end

end
