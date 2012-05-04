class Budget < ActiveRecord::Base

    has_many :notes, :order => "created_at DESC"

    has_many :lines

    has_many :attachments

    audited

end
