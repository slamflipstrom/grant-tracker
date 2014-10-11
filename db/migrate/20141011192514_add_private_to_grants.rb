class AddPrivateToGrants < ActiveRecord::Migration
  def change
    add_column :grants, :private, :boolean
  end
end
