class AddImageExtensionToServer < ActiveRecord::Migration
  def change
    add_column :servers, :extension, :string
  end
end
