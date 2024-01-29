# challenge_read.rb

require_relative 'ar'
require_relative 'models/product'

# Backup the development database
system("cp db/development.sqlite3 db/development_backup.sqlite3")

# Find any product from the database
product = Product.first

if product
  # Inspect the retrieved product object
  puts "Product Details:"
  puts "ID: #{product.id}"
  puts "Name: #{product.name}"
  puts "Price: $#{product.price}"
  puts "Stock Quantity: #{product.stock_quantity}"

  # Total number of products
  total_products = Product.count
  puts "Total number of products: #{total_products}"

  # Names of all products above $10 starting with the letter 'C'
  products_above_10 = Product.where("price > 10 AND name LIKE 'C%'")
  puts "Products above $10 starting with 'C':"
  products_above_10.each do |product|
    puts "- #{product.name}"
  end

  # Total number of products with low stock quantity (< 5)
  low_stock_products = Product.where("stock_quantity < 5").count
  puts "Total number of products with low stock quantity: #{low_stock_products}"
else
  puts "No products found in the database."
end
