require_relative 'ar'
require_relative 'models/product'

# Backup the development database
system("cd db/development.sqlite3 db/development_backup.sqlite3")

# Find any product from the database
product = Product.second

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

  # Find a specific category (let's say we want to add a new product to the category with id = 1)
  category = Category.find_by(id: 1)

  if category
    # Build a new product associated with the category
    new_product = category.products.build(
      name: "New Product Name",
      price: 25.99,
      stock_quantity: 10
    )

  end

  # Find a specific category (let's say we want to find products associated with the category with id = 1)
  category = Category.find_by(id: 1)

  if category
    # Specify the minimum price threshold
    min_price_threshold = 50.0

    # Retrieve all associated products of the category with a price above the threshold
    products_above_threshold = category.products.where("price > ?", min_price_threshold)

    if products_above_threshold.any?
      puts "Products associated with category '#{category.name}' with price above $#{min_price_threshold}:"
      products_above_threshold.each do |product|
        puts "- #{product.name}: $#{product.price}"
      end
    else
      puts "No products associated with category '#{category.name}' above $#{min_price_threshold}."
    end
  else
    puts "Category with id = 1 not found."
  end

else
  puts "No products found in the database."
end
