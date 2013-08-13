class RenameswtCable < ActiveRecord::Migration
  def change
    rename_column(:switch_cables, :type, :cable_type)
  end
end
