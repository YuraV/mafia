class Remove < ActiveRecord::Migration
  def up
    remove_column :games, :user_id
  end

  def down
  end
end
