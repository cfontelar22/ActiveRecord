require_relative 'ar'
require_relative 'models/product'
require_relative 'models/category'
require 'faker'

# Create categories using Faker
5.times do
  Category.create(name: Faker::Commerce.department)
end

# Create 10 sample products assigned to random categories
10.times do
  random_category = Category.all.sample
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10.0..100.0),
    stock_quantity: Faker::Number.between(from: 0, to: 50),
    category_id: random_category.id
  )
end

puts "Sample products created successfully."
