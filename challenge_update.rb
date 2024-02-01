require_relative 'ar'
require_relative 'models/product'

# Find all products with a stock quantity greater than 40
products_greater_than_40 = Product.where("stock_quantity > 40")

if products_greater_than_40.any?
  puts "Products with stock quantity greater than 40:"
  products_greater_than_40.each do |product|
    puts "- #{product.name}: #{product.stock_quantity}"
  end
  
  puts "\nUpdating stock quantity..."
  
  # Iterate over each product and increment the stock quantity by 1
  products_greater_than_40.each do |product|
    product.stock_quantity += 1
    product.save
  end
  
  puts "Stock quantities updated successfully."
else
  puts "No products found with stock quantity greater than 40."
end
