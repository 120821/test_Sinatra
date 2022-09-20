require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.db')

# Can override table name and primary key
class User < ActiveRecord::Base
  #self.table_name = 'user'
  #self.primary_key = 'user_id'
end
