class AddUserIdToRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :user, null: false, foreign_key: true
  end
end
