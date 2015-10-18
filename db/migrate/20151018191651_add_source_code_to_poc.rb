class AddSourceCodeToPoc < ActiveRecord::Migration
  def change
    add_column :pocs, :source_code, :string
  end
end
