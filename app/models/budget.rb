class Budget < ActiveRecord::Base

    has_many :notes, :order => "created_at DESC"

    has_many :lines

    has_many :incomes, :class_name => "Line",
        :conditions => { :category => 'incomes' }

    has_many :expenses, :class_name => "Line",
        :conditions => { :category => 'expenses' }

    has_many :attachments

    audited

end
