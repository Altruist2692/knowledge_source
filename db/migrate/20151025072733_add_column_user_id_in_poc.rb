class AddColumnUserIdInPoc < ActiveRecord::Migration
  def change
    add_column :pocs, :user_id, :integer
  end
end
