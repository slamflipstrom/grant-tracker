class RemoveDueDateFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :due_date
  end

  def down
    add_column :tasks, :due_date, :string
  end
end
