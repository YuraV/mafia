class AppointmentsRole < ActiveRecord::Migration
  def up
    add_column :appointments, :role, :string
  end

  def down
  end
end
