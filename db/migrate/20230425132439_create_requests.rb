class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.date :request_date
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
