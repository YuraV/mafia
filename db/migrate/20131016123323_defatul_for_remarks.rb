class DefatulForRemarks < ActiveRecord::Migration
  def up
    change_column :appointments, :remark, :integer, :default => 0
  end
end
