class Language < ActiveRecord::Base
  # Same language can be used in many language so there is many to many relationship between POC
  # and Language
  has_many :pocs_language
  has_many :pocs, through: :pocs_language
end
