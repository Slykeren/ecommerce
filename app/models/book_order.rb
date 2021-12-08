class BookOrder < ApplicationRecord
    belongs_to :books
    belongs_to :orders

    
end
