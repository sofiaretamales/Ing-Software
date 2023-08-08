class AddProductsAssociationToRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :products_requests, id: false do |t|
      t.belongs_to :product
      t.belongs_to :request
    end
  end
end
