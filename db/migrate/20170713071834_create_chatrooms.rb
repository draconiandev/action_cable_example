class CreateChatrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chatrooms do |t|
      t.string :topic
      t.string :slug

      t.timestamps
    end
    add_index :chatrooms, :topic, unique: true
    add_index :chatrooms, :slug, unique: true
  end
end
