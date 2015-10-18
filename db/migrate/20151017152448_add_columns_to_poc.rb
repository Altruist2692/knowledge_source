class AddColumnsToPoc < ActiveRecord::Migration
  def change
    add_column :pocs, :key_features, :text, array:true, default: []
  end
end
