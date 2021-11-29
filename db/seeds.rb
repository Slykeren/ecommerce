require 'net/http'
require 'json'
require 'pp'
require 'csv'
require 'uri'

AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Book.destroy_all
Genre.destroy_all
BookGenre.destroy_all
Tax.destroy_all



uri_variable = URI("https://www.googleapis.com/books/v1/volumes?q={all}")
res = Net::HTTP.get_response(uri_variable)
data = JSON.parse(res.body, :headers => true, :encoding => "ISO-8859-1")

data["items"].each do |row|

    b = Genre.create(
        genre_name: row["volumeInfo"]["categories"][0]
    )

    a = Book.create(
        name: row["volumeInfo"]["title"],
        author: row["volumeInfo"]["authors"][0],
        user_rating: Faker::Number.between(from: 1, to: 5),
        description: row["volumeInfo"]["description"],
        image_url: row["volumeInfo"]["imageLinks"]["thumbnail"],
        year: row["volumeInfo"]["publishedDate"],
        price: Faker::Commerce.price,
        
    )

    c = BookGenre.create(
        book_id: a.id,
        genre_id: b.id
    )
end
puts "Created books"
puts "created genres"

province_list_url = "https://www.retailcouncil.org/resources/quick-facts/sales-tax-rates-by-province/"
province_list_html = open(province_list_url).read
province_list_doc = Nokogiri::HTML(province_list_html)
province_selector = province_list_doc.css('.table').css('tbody').css('tr')


province_selector.each do |province|

    province_text = province.css('td')[0].text
    tax_text = province.css('td')[5].text.to_f / 100
    
    Tax.create(
        province: province_text,
        amount: tax_text
    )
    puts province_text
end

# div.field-item > ul   #node-115 > div > div > div
