class PocsLanguage < ActiveRecord::Base
  # This class helpful for relationship between poc and language so it belongs to both POC and Language
  belongs_to :poc
  belongs_to :language
end
