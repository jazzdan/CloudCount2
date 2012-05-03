class Line < ActiveRecord::Base

    belongs_to :budget

    has_many :sublines

end
