class Order < ApplicationRecord
    has_many :book_orders 
    has_many :books, through: :book_orders
    has_many :order_items


    validates :user_id, presence: true

end
