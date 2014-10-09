class RemoveFileFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :file
  end

  def down
    add_column :tasks, :file, :string
  end
end
