class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :appeal
      t.integer :money
      t.text :address
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
