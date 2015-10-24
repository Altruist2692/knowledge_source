class AddColumnStatusToPoc < ActiveRecord::Migration
  def change
    add_column :pocs, :status, :string
  end
end
