class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.float :gst
      t.float :pst
      t.float :hst
      t.float :total
      t.string :province

      t.timestamps
    end
  end
end
