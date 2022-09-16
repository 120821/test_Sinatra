# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

configure :development do
  set :database, 'postgres:db/dogs.db'
end

