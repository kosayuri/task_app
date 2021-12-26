class CreateHistroys < ActiveRecord::Migration[6.1]
  def change
    create_table :histroys do |t|
      t.integer :user_id
      t.integer :room_id
      t.datetime :start_day
      t.datetime :end_day
      t.integer :count

      t.timestamps
    end
  end
end
