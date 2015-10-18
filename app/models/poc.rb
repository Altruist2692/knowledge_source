class Poc < ActiveRecord::Base

  # This line will add tagging feature in this model
  acts_as_taggable

  mount_uploader :source_code, SourceCodeUploader
end
