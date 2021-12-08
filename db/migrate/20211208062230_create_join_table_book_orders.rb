class CreateJoinTableBookOrders < ActiveRecord::Migration[6.1]
  def change
    create_join_table :books, :orders, column_options: {foreign_key: true} do |t|
      
      t.index [:book_id, :order_id]
      t.index [:order_id, :book_id]
    end
  end
end
