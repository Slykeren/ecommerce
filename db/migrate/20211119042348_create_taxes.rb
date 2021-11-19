class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.integer :amount
      t.string :province

      t.timestamps
    end
  end
end
