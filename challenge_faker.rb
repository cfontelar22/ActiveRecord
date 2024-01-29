

require_relative 'ar'
require_relative 'models/product'
require 'faker'

# Create 10 sample products
10.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10.0..100.0),
    stock_quantity: Faker::Number.between(from: 0, to: 50)
  )
end

puts "Sample products created successfully."
