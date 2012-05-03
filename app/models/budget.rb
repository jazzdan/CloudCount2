class Budget < ActiveRecord::Base

    has_many :notes

    has_many :lines

    has_many :attachments

    audited

end
