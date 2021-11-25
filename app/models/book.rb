class Book < ApplicationRecord

    has_many :book_genres
    has_many :genres, through: :book_genres
    has_many :book_orders
    has_many :orders, through: :book_orders
    has_many :order_items

end
