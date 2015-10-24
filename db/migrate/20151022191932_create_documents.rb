class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :poc
      t.timestamps null: false
    end
  end
end
