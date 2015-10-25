class Poc < ActiveRecord::Base

  # This line will add tagging feature in this model
  acts_as_taggable

  mount_uploader :source_code, SourceCodeUploader

  #
  # Poc Relationships with other Modal
  #

  # POC has many documents
  has_many :documents, dependent: :destroy

  # POC can be build using many languages and framework so here relationship between poc and language
  # is many to many
  has_many :pocs_language
  has_many :languages,  through: :pocs_language

  # Unable nested attributes for documents through POC
  accepts_nested_attributes_for :documents, allow_destroy: true

  #
  # Poc Model Validations
  #

  validates :name, presence: true
  validates :source_code, presence: true
end
