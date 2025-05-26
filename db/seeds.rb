require "open-uri"
require 'nokogiri'

puts "The furtniture seeds have started"
Rental.destroy_all
Furniture.destroy_all
User.destroy_all
Review.destroy_all

users = [
{email: "original@gmail.com"},
{email: "owen@gmail.com"},
{email: "hayao@gmail.com"},
{email: "tsering@gmail.com"},
]

puts " creating user photos"
users.each do |custom_user|
  user = User.new(
  name: Faker::Name.name,
  email: custom_user[:email],
  password: '123456', # needs to be 6 digits,
  # add any additional attributes you have on your model
)
  # gender options: 'all' or 'male' or 'female'
  gender = 'all'
  # age options: 'all' or '12-18' or '19-25' or '26-35' or '35-50' or '50+'
  age = '26-35'
  # ethnicity options: 'all' or 'asian' or 'white' or 'black' or 'indian' or 'middle_eastern' or 'latino_hispanic'
  ethnicity = 'all'

  url = "https://this-person-does-not-exist.com/new?gender=#{gender}&age=#{age}&ethnic=#{ethnicity}"
  json = URI.open(url).string
  src = JSON.parse(json)['src']
  photo_url = "https://this-person-does-not-exist.com#{src}"
  file = URI.open(photo_url)
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  user.save
end

puts "created 5 user"

# url = "https://furniture-api.fly.dev/v1/products?limit=100"

# response = JSON.parse(URI.open(url).read)

# #  categories = response["data"].map {|furniture_hash| furniture_hash["category"]}.uniq
# #  p categories

#  response['data'].each do |furniture_hash|
#     puts "...creating the furniture #{furniture_hash['name']}..."
#     # create an instance with the hash
#     furniture = Furniture.new(
#       description: furniture_hash['description'],
#       name: furniture_hash['name'],
#       price: rand(10..50),
#       furniture_type: furniture_hash['category'],
#       user: User.all.sample
#     )


#     file = URI.parse(furniture_hash['image_path']).open
#     furniture.photo.attach(io: file, filename: "img.jpg", content_type: "image/jpg")
#     p furniture.save
#     p furniture.errors.full_messages
#   end
# puts "... created #{Furniture.count} furnitures."
# puts 'Finished!'

# STEP 1: Get valid categories from API error response
valid_categories = []
begin
  error_url = "https://furniture-api.fly.dev/v1/products?category=all"
  URI.open(error_url).read # This will trigger a 400
rescue OpenURI::HTTPError => e
  puts "✅ Retrieved valid category list from error response"
  body = e.io.read
  json = JSON.parse(body)
  valid_categories = json.dig("details", 0, "options") || []
end

puts "Valid categories: #{valid_categories.join(', ')}"

# STEP 2: Get product data
url = "https://furniture-api.fly.dev/v1/products?limit=100"
response = JSON.parse(URI.open(url).read)

# STEP 3: Loop and create furniture
response['data'].each do |furniture_hash|
  category = furniture_hash['category']

  # Only seed items with valid categories
  unless valid_categories.include?(category)
    puts "⚠️ Skipping '#{furniture_hash['name']}' — invalid category: #{category}"
    next
  end

  puts "...creating the furniture #{furniture_hash['name']}..."

  furniture = Furniture.new(
    description: furniture_hash['description'],
    name: furniture_hash['name'],
    price: rand(10..50),
    furniture_type: category,
    user: User.all.sample
  )

  begin
    file = URI.parse(furniture_hash['image_path']).open
    furniture.photo.attach(io: file, filename: "img.jpg", content_type: "image/jpg")
  rescue => e
    puts "❌ Failed to fetch image for #{furniture.name}: #{e.message}"
    next
  end

  if furniture.save
    puts "✅ Saved: #{furniture.name}"
  else
    puts "❌ Failed to save: #{furniture.name}"
    puts furniture.errors.full_messages
  end
end

puts "... created #{Furniture.count} furnitures."
puts 'Finished!'
