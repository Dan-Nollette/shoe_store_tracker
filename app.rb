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
  @brands = Brand.all
  erb(:new_store)
end

post '/stores/new' do
  store_brands = []
  params.each do |param|
    unless (param[0] == "captures" || param[0] == "name")
      store_brands.push(Brand.find(param[0].to_i))
    end
  end
  store = Store.create(name: params["name"])
  store.brands.push(store_brands)
  redirect "/"
end

get '/brands/new' do
  erb(:new_brand)
end

post '/brands/new' do
  Brand.create({name: params["name"], price: params["price"].to_f})
  redirect "/"
end
