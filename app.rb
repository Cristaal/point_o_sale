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
  price = params.fetch("price")
  @product = Product.find(params.fetch("id"))
  @product.update({ :price => price, :description => description })
  erb(:product)
end

delete("/products/:id") do
  @product = Product.find(params.fetch("id"))
  @product.delete()
  @products = Product.all()
  erb(:index)
end

get("/purchase/:id") do
  @purchase = Purchase.create({ :name => "Your Order" })
  @products = Product.all()
  erb(:purchases)
end

patch("/purchase/:id") do
  purchase_id = params.fetch("id")
  @purchase = Purchase.find(purchase_id)
  product_ids = params.fetch("product_ids")
  @purchase.update({:product_ids => product_ids})
  @products = Product.all()
  binding.pry
  erb(:purchases)
end
