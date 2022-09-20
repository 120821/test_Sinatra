require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'datasetter_development')

#这个是单独使用ActiveRecord的脚本，也没有使用sinatra,使用方法就是直接ruby create_tables.rb 就可以了
class User < ActiveRecord::Base
end

class Account < ActiveRecord::Base
end

#class CreateAccountTable < ActiveRecord::Migration[5.2]
#  def change
#    create_table :accounts do |table|
#      table.string :first_name
#      #注意这里的last_name 之前进行migrate的时候是integer，所以数据库的数据都是零。还没rollback
#      table.string :last_name
#      table.timestamps null: false
#    end
#  end
#end

class Manager < ActiveRecord::Base
end

#class CreateManagerTable < ActiveRecord::Migration[5.2]
#  def change
#    create_table :managers do |table|
#      table.string :first_name
#      table.string :last_name
#      table.timestamps null: false
#    end
#  end
#end

# Create the table
#CreateManagerTable.migrate(:up)
class Apple < ActiveRecord::Base
end

#class CreateAppleTable < ActiveRecord::Migration[5.2]
#  def change
#    create_table :apples do |table|
#      table.string :first_name
#      table.string :last_name
#      table.timestamps null: false
#    end
#  end
#end

class Banana < ActiveRecord::Base
end

#class CreateBananaTable < ActiveRecord::Migration[5.2]
#  def change
#    create_table :bananas do |table|
#      table.string :first_name
#      table.string :last_name
#      table.timestamps null: false
#    end
#  end
#end

(1..9930000).each do |i|
  if Banana.all.size < 10000000
    Banana.create first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
  end
  if i % 10000 == 0
    puts Banana.all.size
  end
end


class Cherry < ActiveRecord::Base
end

class CreateCherryTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cherries do |table|
      table.string :first_name
      table.string :last_name
      table.timestamps null: false
    end
  end
end
# Create Banana table 1000w
#CreateBananaTable.migrate(:up)

#(1..10000).each do |i|
#  Banana.create first_name: "jim", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
#  #puts Banana.all.size
#end

#(1..10000).each do |i|
#  Banana.create last_name: "jim", first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
#  #puts Banana.all.size
#end

#(1..99800000).each do |i|
#  Cherry.create first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
#  if i % 10000 == 0
#    puts Cherry.all.size
#  end
#end

# Create the table 10000w
#CreateCherryTable.migrate(:up)

#(1..10000).each do |i|
#  Cherry.create first_name: "jim", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
#  puts Cherry.all.size
#end

#(1..10000).each do |i|
#  Cherry.create last_name: "jim", first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
#  puts Cherry.all.size
#end

# Create Apple table 100w
#CreateAppleTable.migrate(:up)

#(1..10000).each do |i|
#  Apple.create first_name: "jim", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
#  #puts Apple.all.size
#end

#(1..10000).each do |i|
#  Apple.create last_name: "jim", first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
#  #puts Apple.all.size
#end

#(1..980000).each do |i|
#  Apple.create first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
#  if i % 10000 == 0
#    puts Apple.all.size
#  end
#end


#(1..10000).each do |i|
#  Manager.create first_name: "jim", last_name: "#{('A'..'Z').to_a.shuffle[0,5].join}"
#  puts Manager.all.size
#end

#(1..10000).each do |i|
#  Manager.create last_name: "jim", first_name: "#{('A'..'Z').to_a.shuffle[0,5].join}"
#  puts Manager.all.size
#end

#(1..980000).each do |i|
#  Manager.create first_name: "#{('A'..'Z').to_a.shuffle[0,5].join}", last_name: "#{('A'..'Z').to_a.shuffle[0,5].join}"
##  puts Manager.all.size
#  if i % 100000 == 0
#    puts Manager.all.size
#  end
#end

#80000.times do |i|
#end
# Drop the table
#CreateAccountTable migrate(:down)
# Create the table
#CreateAccountTable.migrate(:up)

#(1..10000).each do |i|
#  Account.create first_name: "jim", last_name: "#{('A'..'Z').to_a.shuffle[0,5].join}"
#  puts Account.all.size
#end

#(1..10000).each do |i|
#  Account.create last_name: "jim", first_name: "#{('A'..'Z').to_a.shuffle[0,5].join}"
#  puts Account.all.size
#end

#(1..80000).each do |i|
#  Account.create first_name: "#{('A'..'Z').to_a.shuffle[0,5].join}", last_name: "#{('A'..'Z').to_a.shuffle[0,5].join}"
#  puts Account.all.size
#end
#80000.times do |i|
#end
# Drop the table
#CreateAccountTable migrate(:down)

#User.columns.each { |column|
#  puts column.name
#  puts column.type
#}
## Create a new user object then save it to store in database
#new_user = User.new(name: 'Dano')
#puts "=== befor save user: "
#puts new_user.inspect
#new_user.save
#puts "=== after save user: "
#puts new_user.inspect
#puts "=== after save user.all.size: "
#puts User.all.size

#User.new { |u|
#  u.name = 'NanoDano'
#}.save
#puts "=== after save user.all.size: "
#puts User.all.size


## Create and save in one step with `.create()`
#User.create(name: 'John Leon')
#puts "=== after save user.all.size: "
#puts User.all.size

