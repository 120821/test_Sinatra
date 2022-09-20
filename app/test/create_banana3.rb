require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'datasetter_development')
class Banana < ActiveRecord::Base
end
(1..500000).each do |i|
  Banana.create first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
  if i % 1000 == 0
    puts Banana.all.size
  end
end
