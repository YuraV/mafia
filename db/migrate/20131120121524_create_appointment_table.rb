class CreateAppointmentTable < ActiveRecord::Migration
  def up
    create_table :appointments do |t|
      t.integer :id
      t.string :name
    end

  end

end
