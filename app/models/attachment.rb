class Attachment < ActiveRecord::Base
  has_attached_file :file,
  :store => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  # :path => ":attachment/files/:id.:extension",
  :bucket => 'cloudcount'

  audited

end
