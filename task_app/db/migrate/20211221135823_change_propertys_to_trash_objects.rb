class ChangePropertysToTrashObjects < ActiveRecord::Migration[6.1]
  def change
    rename_table :properties, :rooms
  end
end
