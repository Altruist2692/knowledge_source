class CreatePocs < ActiveRecord::Migration
  def change
    create_table :pocs do |t|
      t.string :name
      t.timestamps :start_at
      t.timestamps :end_at
      t.text :description
      t.integer :revision_number
      t.string :revision_note
      t.timestamps null: false
    end
  end
end
