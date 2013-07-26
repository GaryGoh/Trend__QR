class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :QR_code
      t.string :IP
      t.string :IDR
      t.integer :CPU
      t.integer :RAM
      t.integer :Storage
      t.string :MAC

      t.timestamps
    end
  end
end
