class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
