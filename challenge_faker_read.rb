require_relative 'ar'
require_relative 'models/product'

# Retrieve all categories from the database
categories = Category.includes(:products)

# Display category names and associated products
categories.each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  - Product: #{product.name}, Price: #{product.price}"
  end
end
