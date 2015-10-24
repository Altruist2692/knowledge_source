class Poc < ActiveRecord::Base

  # This line will add tagging feature in this model
  acts_as_taggable

  mount_uploader :source_code, SourceCodeUploader

  # POC has many documents
  has_many :documents, dependent: :destroy

  # Unable nested attributes for documents through POC
  accepts_nested_attributes_for :documents, allow_destroy: true
end
