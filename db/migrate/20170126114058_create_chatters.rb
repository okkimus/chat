class CreateChatters < ActiveRecord::Migration
  def change
    create_table :chatters do |t|
      t.integer :user_id
      t.integer :room_id
    end
    add_index :chatters, :user_id
    add_index :chatters, :room_id
  end
end
