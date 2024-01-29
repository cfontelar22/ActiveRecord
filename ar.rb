require 'active_record'
require 'faker'

# Define ApplicationRecord as the base class for ActiveRecord models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

# Establish database connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

# Define Category and Product models
class Category < ApplicationRecord
  has_many :products
end

class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
