require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'datasetter_development')
class Cherry < ActiveRecord::Base
end
(1..1000000).each do |i|
  Cherry.create first_name: "#{('A'..'Z').to_a.shuffle[0,300].join}", last_name: "#{('A'..'Z').to_a.shuffle[0,300].join}"
  if i % 10000 == 0
    puts Cherry.all.size
  end
end
