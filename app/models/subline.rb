class Subline < ActiveRecord::Base

    belongs_to :line

    has_many :transactions

end
