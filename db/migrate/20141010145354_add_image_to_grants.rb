class AddImageToGrants < ActiveRecord::Migration
  def change
    add_column :grants, :image, :string
  end
end
