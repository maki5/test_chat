class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :dialect
      t.string :user_name
      t.integer :chat_room_id
    end
  end
end
