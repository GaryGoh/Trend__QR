class AddSwitchIdAndServerIdToSwitchCables < ActiveRecord::Migration
  def change
    add_column :switch_cables, :switch_id, :integer
    add_column :switch_cables, :server_id, :integer
  end
end
