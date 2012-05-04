class Attachment < ActiveRecord::Base
  belongs_to :budget
  
  has_attached_file :file,
  :storage => :s3,
  # :s3_credentials => "#{Rails.root}/config/s3.yml",
  :s3_credentials => {"access_key_id" => ENV['S3_KEY'], "secret_access_key" => ENV['S3_SECRET']},
  # :path => ":attachment/files/",
  :bucket => 'cloudcount'

  audited

end
