class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :grant_id
      t.string :name

      t.timestamps
    end
  end
end
