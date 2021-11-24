class Order < ApplicationRecord
    has_many :book_orders 
end
