class BookGenre < ApplicationRecord
    has_many :books
    has_many :genres
end
