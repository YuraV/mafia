class AddRemarksToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :remark, :integer
  end
end
