class AddFileToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :file, :string
  end
end
