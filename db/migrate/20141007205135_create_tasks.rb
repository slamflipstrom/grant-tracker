class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :due_date
      t.text :description
      t.integer :user_id
      t.integer :grant_id

      t.timestamps
    end
  end
end
