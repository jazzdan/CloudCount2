class Transaction < ActiveRecord::Base

    belongs_to :subline

    audited
end
