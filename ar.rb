# ar.rb

require 'active_record'

# Establish the database connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

# Ensure that ActiveRecord models are loaded from the models directory
Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |file| require file }
