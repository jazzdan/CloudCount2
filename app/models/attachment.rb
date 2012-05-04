class Attachment < ActiveRecord::Base
  belongs_to :budget
  
  has_attached_file :file,
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  # :path => ":attachment/files/",
  :bucket => 'cloudcount'

  audited

end
