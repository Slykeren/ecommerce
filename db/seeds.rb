# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

require 'net/http'
require 'json'
require 'pp'
require 'csv'
require 'uri'

Book.destroy_all

csv_data = File.read(Rails.root.join('db/books.csv'))
csv = CSV.parse(csv_data, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    book = Book.new
    book.name = row['Name']
    book.author = row['Author']
    book.user_rating = row['User Rating']
    book.review = row['Reviews']
    book.price = row['Price']
    book.year = row['Year']
    book.save

end
puts "books added"
