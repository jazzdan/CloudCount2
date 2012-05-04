class Subline < ActiveRecord::Base

    belongs_to :line

    has_many :transactions, :order => 'created_at DESC'

    audited

    def actual
        return 0.00
    end

end
