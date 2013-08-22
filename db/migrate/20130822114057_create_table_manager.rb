class CreateTableManager < ActiveRecord::Migration
  def change
    create_table(:managers) do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
