class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.decimal :user_rating
      t.string :review
      t.decimal :price
      t.integer :year
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
