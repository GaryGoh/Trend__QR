class CreateCables < ActiveRecord::Migration
  def change
    create_table :cables do |t|
      t.integer :server_id
      t.string :to_end
      t.string :from_nic
      t.string :to_nic
      t.string :color

      t.timestamps
    end
  end
end
