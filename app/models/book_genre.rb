class BookGenre < ApplicationRecord
    belongs_to :books
    belongs_to :genres
end
