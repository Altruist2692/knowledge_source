class CreatePocsLanguages < ActiveRecord::Migration
  def change
    create_table :pocs_languages do |t|
      t.references :poc, :integer
      t.references :language, :integer
      t.timestamps null: false
    end
  end
end
