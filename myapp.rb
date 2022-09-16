require 'sinatra'
require 'yaml/store'
require "sinatra/activerecord"
set :database, {adapter: "sqlite3", database: "foo.sqlite3"}

class User < ActiveRecord::Base
  validates_presence_of :name
end
class MyApplication < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end

class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get('/each') { Stream.new }


get '/users' do
  @users = User.all
  erb :index
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :show
end


get '/' do
  @title = 'Welcome to the Suffragist!'
  Choices = {
    'HAM' => 'Hamburger',
    'PIZ' => 'Pizza',
    'CUR' => 'Curry',
    'NOO' => 'Noodles',
  }
  erb :index
end

post '/cast' do
  @title = 'Thanks for casting your vote!'
  @vote  = params['vote']
  @store = YAML::Store.new 'votes.yml'
  @store.transaction do
    @store['votes'] ||= {}
    @store['votes'][@vote] ||= 0
    @store['votes'][@vote] += 1
  end
  erb :cast
end

get '/results' do
  @title = 'Results so far:'
  @store = YAML::Store.new 'votes.yml'
  @votes = @store.transaction { @store['votes'] }
  erb :results
end

get '/hello' do
  'Hello, voter!'
  'hello world'
end

get '/post' do
  erb :content, :layout => :post
end
get '/app' do
  erb :index, :layout => :application
end

get '/apple' do
  code = "<%= Time.now %>"
  erb code
end


get '/hello/:name' do
  "Hello #{params['name']}!"
end

get '/hi/:color' do |n|
  "Hi#{params['color']}!"
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params['splat'] # => ["hello", "world"]
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  params['splat'] # => ["path/to/file", "xml"]
end




