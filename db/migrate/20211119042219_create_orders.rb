class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :book_id
      t.integer :customer_id
      t.float :price
      t.float :tax
      t.float :subtotal
      t.float :total



      t.timestamps
    end
  end
end
