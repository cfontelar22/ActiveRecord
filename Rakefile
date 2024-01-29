# Rakefile

require 'active_record'
require_relative 'ar'  # Assuming your ActiveRecord configuration is in ar.rb

namespace :db do
  desc "Migrate the database"
  task :migrate do
    ActiveRecord::MigrationContext.new('db/migrate').migrate
  end
end
