class CreateSwitchCables < ActiveRecord::Migration
  def change
    create_table :switch_cables do |t|
      t.string :cable_type
      t.integer :port_vlan
      t.string :mode
      t.string :from_device
      t.string :to_device
      t.string :from_port
      t.string :to_port
      t.string :port_protocal
      t.string :color
      t.integer :switch_id
      t.integer :server_id

      t.timestamps
    end
  end
end
