class Subline < ActiveRecord::Base

    belongs_to :line

    has_many :transactions, :order => 'created_at DESC', :dependent => :destroy

    audited

    def actual
        if @actual_total.nil?
            @actual_total = self.transactions.reduce(0) do |sum, transaction|
                sum + transaction.subtotal
            end
        end
        @actual_total
    end

end
