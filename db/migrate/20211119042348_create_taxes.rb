class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.float :amount
      t.string :province

      t.timestamps
    end
  end
end
