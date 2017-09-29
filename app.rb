require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

get '/stores/new' do
  "Hello World"
end

get '/brands/new' do
  erb(:new_brand)
end

post '/brands/new' do
  Brand.create({name: params["name"], price: params["price"].to_f})
  redirect "/"
end
