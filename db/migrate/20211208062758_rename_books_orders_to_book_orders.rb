class RenameBooksOrdersToBookOrders < ActiveRecord::Migration[6.1]
  def change
    rename_table :books_orders, :book_orders
  end
end
