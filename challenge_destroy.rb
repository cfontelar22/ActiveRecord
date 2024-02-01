

require_relative 'ar'
require_relative 'models/product'

# Find a product by its ID and delete it from the database
product_id_to_delete = 43

product_to_delete = Product.find_by(id: product_id_to_delete)

if product_to_delete
  puts "Product found. Deleting #{product_to_delete.name}..."
  product_to_delete.destroy
  puts "Product deleted successfully."
else
  puts "Product not found."
end
