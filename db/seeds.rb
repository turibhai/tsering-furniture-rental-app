puts "The furtniture seeds have started"
Rental.destroy_all
Furniture.destroy_all
User.destroy_all

User.create!(email: "furniture@gmail.com", password: "123456")
User.create!(email: "furniture2@gmail.com", password: "123456")
User.create!(email: "furniture3@gmail.com", password: "123456")
User.create!(email: "furniture4@gmail.com", password: "123456")

User.all.each do |user|
  5.times do
    Furniture.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: rand(10..50),
      furniture_type: Furniture::CATEGORIES.sample,
      user: user
    )
  end
  puts "I have seeded 20 furnitures"
end
