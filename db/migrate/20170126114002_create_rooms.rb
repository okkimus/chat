class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :password
      t.boolean :privacy

      t.timestamps null: false
    end
  end
end
