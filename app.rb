require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/product")
require("./lib/purchase")
require("pg")
require("pry")

get("/") do
  @products = Product.all()
  erb(:index)
end

post("/product") do
  name = params.fetch("name")
  price = params.fetch("price")
  @product = Product.create({ :name => name, :price => price })
  @products = Product.all()
  erb(:index)
end
