require 'net/http'
require 'json'
require 'pp'
require 'csv'
require 'uri'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Book.destroy_all

uri_variable = URI("https://www.googleapis.com/books/v1/volumes?q={all}")
res = Net::HTTP.get_response(uri_variable)
data = JSON.parse(res.body, :headers => true, :encoding => "ISO-8859-1")

data["items"].each do |row|
    a = Book.create(
        name: row["volumeInfo"]["title"],
        author: row["volumeInfo"]["authors"][0],
        user_rating: Faker::Number.between(from: 1, to: 5),
        description: row["volumeInfo"]["description"],
        image_url: row["volumeInfo"]["imageLinks"]["thumbnail"],
        year: row["volumeInfo"]["publishedDate"],
        price: Faker::Commerce.price,
        
    )
    
    b = Genre.create(
        name: row["volumeInfo"]["categories"][0]
    )

end
puts "Created books"

