 class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    rename_column :users, :name,:first_name
    add_column :users, :last_name, :string
  end
end
