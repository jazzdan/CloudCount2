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

    def budget
        return 0.00
    end

    def actual
        return 0.00
    end

    def excess
        return 0.00
    end

end
