class Budget < ActiveRecord::Base

    has_many :notes, :order => "created_at DESC"

    has_many :lines

    has_many :incomes, :class_name => "Line",
        :conditions => { :category => 'incomes' },
        :order => 'line_number ASC'

    has_many :expenses, :class_name => "Line",
        :conditions => { :category => 'expenses' },
        :order => 'line_number ASC'

    has_many :attachments

    audited

end
