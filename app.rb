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

get '/stores/:id' do
  @brands = Brand.all
  @store = Store.find(params['id'])
  erb(:store)
end

get '/brands/:id' do
  @brand = Brand.find(params['id'])
  erb(:brand)
end

patch '/stores/:id' do
  brands = []
  params.each do |param|
    unless (param[0] == "id" || param[0] == "captures" || param[0] == "_method" || param[0] == "name")
      puts "%%%%%%%%%%%%%"
      puts param
      puts param[0]
      brands.push(Brand.find(param[0].to_i))
    end
  end
  @store = Store.find(params['id'])
  @store.update(name: params['name'], brands: brands)
  redirect "/stores/#{@store.id.to_s}"
end

delete '/stores/:id' do
  Store.find(params["id"].to_i).destroy
  redirect "/"
end
