

class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

  # Columns in the 'products' table:
  #
  # - id: integer (primary key)
  # - name: string
  # - price: decimal
  # - stock_quantity: integer
  # - category_id: integer (foreign key referencing 'categories' table)
  # - created_at: datetime
  # - updated_at: datetime