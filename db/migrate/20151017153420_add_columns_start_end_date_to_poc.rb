class AddColumnsStartEndDateToPoc < ActiveRecord::Migration
  def change
    add_column :pocs, :start_poc_at, :datetime
    add_column :pocs, :end_poc_at, :datetime
  end
end
