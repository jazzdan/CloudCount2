class Line < ActiveRecord::Base
    attr_accessible :category, :budget_id, :line_number, :name, :subtotal, :order

    belongs_to :budget

    has_many :sublines

    audited

end
