class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.text :message
      t.string :sender
      t.string :receiver

      t.timestamps
    end
  end
end
