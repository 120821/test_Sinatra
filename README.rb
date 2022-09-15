sinatra 入门
Sinatra 是一个简单的 Ruby DSL，用于快速创建 Web 应用程序。
它内置了路由功能，使用模板，提供静态文件，帮助程序，错误处理和许多其他主题。
http://www.sinatrarb.com/intro.html

# app.rb
require 'sinatra'

get '/' do
    'Hello, Universe!'
end

安装 Sinatra：
gem install sinatra

运行应用程序：
ruby app.rb
进入 http：// localhost：4567 访问你的应用


你可以将 Sinatra 安装为全局 gem：
gem install sinatra
或将其添加到项目的 Gemfile 中
# in Gemfile:
gem 'sinatra'
并运行 bundle install。

什么是路由
在 Sinatra 中，路由是你的应用程序响应请求的方式，请求的路径（例如/welcome）和使用的 HTTP 动词（例如 GET 或 POST）。请求的编写方式如下：

<http-verb> <path> do
    <code block to execute when this route is requested>
end

这是一个示例，通过返回一个“Hi，whats up”页面来响应 GET 对/hello 路径的请求：

get "/hello" do
    return "Hi, whats up"
end

Sinatra 仅响应你定义的路线。如果你没有定义路线，Sinatra 会返回一个 404 Page Not Found 错误页面。
Sinatra 将带有和不带前向斜线（/）的路线视为 2 条不同且不同的路线。也就是说，get '/hello'和 get '/hello/'默认匹配不同的代码块。如果要忽略尾部正斜杠并将两条路径视为相同，则可以在正斜杠后添加 ? 以使其可选，如下所示：get '/hello/?'。

可用的 Sinatra 路由动词


Sinatra 中有许多可用的路由动词，它们直接对应于 http 动词

get '/' do
  .. get some data, a view, json, etc ..
end

post '/' do
  .. create a resource ..
end

put '/' do
  .. replace a resource ..
end

patch '/' do
  .. change a resource ..
end

delete '/' do
  .. delete something ..
end

options '/' do
  .. appease something ..
end

link '/' do
  .. affiliate something ..
end

unlink '/' do
  .. separate something ..
end

基于 Regexp 的路径匹配
匹配路径的路径时，你可以显式地执行此操作，仅匹配一个路径，如下所示：

get "/hello" do
    return "Hello!"
end

你还可以使用正则表达式来匹配复杂路径。与正则表达式匹配的任何路由都将运行该代码块。如果多个路由可能与请求匹配，则执行第一个匹配的路由。

以下是匹配路径的典型示例，其中包含/user/后跟一个或多个数字（可能是用户 ID），即 GET /user/1：

get /\/user\/\d+/ do
  "Hello, user!"
end

上面的示例匹配/user/1，但也匹配/delete/user/1 和/user/1/delete/now，因为我们的正则表达式不是非常严格，并且允许与路径的任何部分进行部分匹配。

我们可以更加明确地使用正则表达式并告诉它与路线完全匹配，使用\A 和\z 指令将匹配锚定到路径的开头和结尾：

get /\A\/user\/\d+\z/ do
  "Hello, user!"
end

由于匹配锚定，此路线将不匹配/delete/user/1 或/user/1/delete/now。
忽略尾随/

我们上面的示例路由也不匹配/user/1/（尾随正斜杠）。如果要忽略路径末尾的尾部斜杠，请调整正则表达式以使斜杠可选（ 请注意末尾的\/? ）：

get /\A\/user\/\d+\/?\z/ do
  "Hello, user! You may have navigated to /user/<ID> or /user/<ID>/ to get here."
end

捕获路线匹配

到目前为止，我们已经匹配了 regexp 路由，但是如果我们想在代码块中使用匹配的值呢？按照我们的示例，我们如何知道执行路由时用户的 ID 是什么？

我们可以捕获路径的所需部分，并使用 Sinatra 的 param :captures

变量来处理路径中的数据：

get /\A\/user\/(\d+)\/?\z/ do
  "Hello, user! Your ID is #{params['captures'].first}!"
end

Sinatra 路线参数
当然，你可以将数据传递到 Sinatra 路线，接受路线中的数据，你可以添加路线参数。然后，你可以访问 params 哈希：

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello #{params['name']}!"
end

你也可以直接将参数分配给变量，就像我们在 Ruby 哈希中通常所做的那样：

get '/hello/:name' do |n|
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  # n stores params['name']
  "Hello #{n}!"
end

你还可以使用 asteriks 添加没有任何特定名称的通配符参数。然后可以使用 params ‘splat′

访问它们：

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params['splat'] # => ["hello", "world"]
end
