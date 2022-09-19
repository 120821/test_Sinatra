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
  a.to_json
end

get '/' do
  "hello world"
end

#新建user
get '/user/new' do
  erb :'users/new'
end

post '/user/new' do
  @user = User.create name: params['name']
  if @user.save
    redirect "/users/#{@user.id}"
  else
    erb :"users/new"
  end
end

put '/user/:id' do
  @user = User.find params[:id]
  @user.update name: params['name']
  if @user.save
    redirect "/users/#{@user.id}"
  else
    erb :"users"
  end
end

delete '/user/:id' do
  @user = User.find params[:id]
  @user.destroy
  #@user = @user.delete_all
  erb :"users"
end

get '/users/?' do
  @title = 'hihihi! users'
  @users = User.all.order('id desc')
  @count = @users.all.size
#  @users.to_json
  erb :users
end

#show页面
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

#删除
post "/users/:id" do
  @user = User.find(params[:id])
  @user.destroy
  redirect_back "/users"
#  erb :users
end
