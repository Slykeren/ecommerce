class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :user_rating
      t.string :review
      t.integer :price
      t.integer :year

      t.timestamps
    end
  end
end
