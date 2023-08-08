class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :seller
      t.integer :price
      t.string :category
      t.text :image_data

      t.timestamps
    end
  end
end
