class RenameCoulmnUserName < ActiveRecord::Migration
  def up
    rename_column :users, :user_name, :name
  end

  def down
  end
end
