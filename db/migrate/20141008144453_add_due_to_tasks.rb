class AddDueToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :due, :datetime
  end
end
