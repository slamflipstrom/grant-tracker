class RemoveFileFromUploads < ActiveRecord::Migration
  def up
    remove_column :uploads, :file
  end

  def down
    add_column :uploads, :file, :string
  end
end
