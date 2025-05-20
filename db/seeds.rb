require "open-uri"

puts "The furtniture seeds have started"
Rental.destroy_all
Furniture.destroy_all
User.destroy_all

User.create!(email: "furniture@gmail.com", password: "123456")
User.create!(email: "furniture2@gmail.com", password: "123456")
User.create!(email: "furniture3@gmail.com", password: "123456")
User.create!(email: "furniture4@gmail.com", password: "123456")

# User.all.each do |user|
#   5.times do
#     Furniture.create!(
#       name: Faker::Commerce.product_name,
#       description: Faker::Lorem.sentence,
#       price: rand(10..50),
#       furniture_type: Furniture::CATEGORIES.sample,
#       user: user
#     )
#   end
#   puts "I have seeded 20 furnitures"
# end


url = "https://furniture-api.fly.dev/v1/products?limit=100"
 response = JSON.parse(URI.open(url).read)

#  categories = response["data"].map {|furniture_hash| furniture_hash["category"]}.uniq
#  p categories

 response['data'].each do |furniture_hash|
    puts "...creating the furniture #{furniture_hash['name']}..."
    # create an instance with the hash
    furniture = Furniture.new(
      description: furniture_hash['description'],
      name: furniture_hash['name'],
      price: furniture_hash['price'],
      furniture_type: furniture_hash['category'],
      user: User.all.sample
    )

    file = URI.parse(furniture_hash['image_path']).open   
    furniture.photo.attach(io: file, filename: "img.jpg", content_type: "image/jpg")
    p furniture.save
    p furniture.errors.full_messages
  end
puts "... created #{Furniture.count} furnitures."