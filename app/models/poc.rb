class Poc < ActiveRecord::Base

  # This line will add tagging feature in this model
  acts_as_taggable

  mount_uploader :source_code, SourceCodeUploader

  #
  # Poc Relationships with other Modal
  #

  # POC has many documents
  has_many :documents, dependent: :destroy

  belongs_to :user
  # POC can be build using many languages and framework so here relationship between poc and language
  # is many to many
  has_many :pocs_language
  has_many :languages,  through: :pocs_language

  # Unable nested attributes for documents through POC
  accepts_nested_attributes_for :documents, allow_destroy: true

  #
  # Poc Model Validations
  #

  validates :name, presence: true, length: { maximum: 100}
  validates :source_code, presence: true
  validates :description, length: { maximum: 500 }
  validate :end_date_validations
  validate  :validate_future_end_date
  validate :validate_start_poc_at

  # Form datepicker returns mm.dd.yyyy so this method will parse and return proper sart_poc_at
  def start_poc_at=(val)
    write_attribute(:start_poc_at, Date.strptime(val, "%m/%d/%Y")) if val.present?
  end

  # Form datepicker returns mm.dd.yyyy so this method will parse and return proper end_poc_at
  def end_poc_at=(val)
    write_attribute(:end_poc_at, Date.strptime(val, "%m/%d/%Y")) if val.present?
  end

  # This is to verify that the start date is present or not if end date  is present
  def end_date_validations
    if end_poc_at.present?
      errors.add :base, "Please start date first!" unless start_poc_at.present?
    end
  end

  # End date must be greater than start date.
  def validate_future_end_date
    if end_poc_at.present? && start_poc_at.present?
      errors.add :base, "End date must be greater than start date!" if  start_poc_at > end_poc_at
    end
  end

  # This method checks that the start date is present or not if end date is not present
  def validate_start_poc_at
    if end_poc_at.present? && start_poc_at.nil?
      errors.add :base, "Start date must be present if end date is present"
    end
  end
end
