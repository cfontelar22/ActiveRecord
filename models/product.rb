

class Product < ActiveRecord::Base
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
  