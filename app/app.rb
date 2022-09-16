require 'sinatra'
require 'sinatra/activerecord'

class User < ActiveRecord::Base
end

class Stream
  def each
    a = {
      "result": [
        User.all.map do |user| {
          "name": user.name,
          "id": user.id
        }
        end
      ]
    }
    yield a.to_json
    100.times { |i| yield "#{i}\n" }
    #这样也可以批量创建数据User
    #i默认从0开始
    #10.times do |i|
    # "#{i} Creating User"
    #  User.create! name: "#{i}name"
    #  yield "#{user.ispect}"
    #end

  end
end

get('/each') { Stream.new }
#可以创建json

#单独页面也可以的
get '/api/v1/json' do
  #render json: {
  #  result: User.all.to_json
  #}
  a = {
    "result": [
      User.all.map do |user| {
        "name": user.name,
        "id": user.id
      }
      end
    ]
  }
  "#{a.to_json}"
end

#新建user
post '/new_one' do
  @users = User.all
  @user = User.create(params[:name])
  erb :user_new
end
get '/new' do
  @users = User.all
  @user = User.create(params[:name])
  erb :user_new
end

get '/users/?' do
  @title = 'hihihi! users'
  @users = User.all.order('id desc')
  @count = @users.all.size
#  @users.to_json
  erb :users
end
get '/user_new/:id' do
  @title = 'hihihi!'
  @user = User.find(params[:id])
  @user = User.create name: params['name']
  erb :user_new
end
post '/user_create' do
  @title = 'hihihi!'
  @user = User.find(params[:id])
  @user = User.create name: params['name']
end

get '/users/:id' do
  @user= User.find(params[:id])
  #这两个erb渲染写法都可以使用
  erb :'users/show'
  #erb :user_show
end
#这种写法也生效的，find_by_id
#get '/users/:id/?' do
#  @user = User.find_by_id(params[:id])
#  @user.to_json
#end


post "/users/:id" do
  @user = User.find(params[:id])
  @user.destroy
  redirect_back "/users"
#  erb :users
end

class App < Sinatra::Base
  before do
    content_type :json
  end

end

get '/' do
  'Hello!'
end
