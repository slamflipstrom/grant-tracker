class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string :name
      t.integer :organization_id

      t.timestamps
    end
  end
end
