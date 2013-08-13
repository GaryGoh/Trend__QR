class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.string :switch_name
      t.integer :num_ports
      t.integer :rack
      t.string :admin_ip

      t.timestamps
    end
  end
end
