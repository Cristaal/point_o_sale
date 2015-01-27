require("spec_buddy")

  describe(Purchase) do

  it("will return the purchase id of the products") do
    purchase = Purchase.create({:name => "Purchase1"})
    product = Product.create({:name => "sunscreen", :price => 1.50, :purchase_id => purchase.id})
  end
end
