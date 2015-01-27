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

get("/product/:id") do
  @product = Product.find(params.fetch("id"))
  erb(:product)
end

patch("/products/:id") do
  description = params.fetch("description")
  @product = Product.find(params.fetch("id"))
  @product.update({ :description => description })
  erb(:product)
end
