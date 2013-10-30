class RemoveColumnUsersRole < ActiveRecord::Migration
  def up
    remove_column :users, :role
  end

  def down
  end
end
