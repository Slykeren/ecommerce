class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :tax
      t.decimal :subtotal
      t.decimal :total



      t.timestamps
    end
  end
end
