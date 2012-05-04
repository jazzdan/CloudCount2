class Budget < ActiveRecord::Base

    has_many :notes, :order => "created_at DESC", :dependent => :destroy

    has_many :lines, :dependent => :destroy

    has_many :incomes, :class_name => "Line",
        :conditions => { :category => 'incomes' },
        :order => 'line_number ASC'

    has_many :expenses, :class_name => "Line",
        :conditions => { :category => 'expenses' },
        :order => 'line_number ASC'

    has_many :attachments, :dependent => :destroy

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

end
