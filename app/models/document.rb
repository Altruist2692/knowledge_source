class Document < ActiveRecord::Base
  belongs_to :poc
  mount_uploader :file, DocumentUploader
end
