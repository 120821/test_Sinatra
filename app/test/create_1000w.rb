require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'datasetter_development')
class Cherry < ActiveRecord::Base
end
(1..99980000).each do |i|
  if Cherry.all.size < 100000000
    Cherry.create first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
  end
  if i % 10000 == 0
    puts Cherry.all.size
  end
end
