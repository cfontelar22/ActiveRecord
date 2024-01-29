

require_relative 'ar'
require_relative 'models/product'

# Create new products using different methods

# Method 1: Using the 'new' method followed by 'save'
product1 = Product.new(name: 'Product 1', price: 20.0, stock_quantity: 10)
product1.save

# Method 2: Using the 'create' method
product2 = Product.create(name: 'Product 2', price: 30.0, stock_quantity: 15)

# Method 3: Using the 'create!' method (with invalid data to demonstrate error handling)
product3 = Product.create(name: 'P2', price: -10.0, stock_quantity: 'abc')

# Print the errors for product3 (if any)
puts "Errors for product3:"
puts product3.errors.full_messages.join(', ')
