class RenameAppointmentToPlayer < ActiveRecord::Migration
  def up
    rename_table :appointments, :players
  end

  def down
    rename_table :players, :appointments
  end
end
