require("spec_buddy")

describe(Purchase) do

  it("tells which product are in the purchase") do
    purchase = Purchase.create({ :name => "Purchase" })
    product1 = Product.create({ :name => "candy bar", :price => 1.20, :purchase_id => purchase.id })
    expect(purchase.products()).to eq([product1])
  end
end
