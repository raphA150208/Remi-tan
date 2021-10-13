class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :users, :name, :string, null: false
  end
end