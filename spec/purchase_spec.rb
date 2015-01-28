require("spec_buddy")

describe(Purchase) do

  it("tells which product are in the purchase") do
    purchase = Purchase.create({ :name => "Purchase" })
    product1 = Product.create({ :name => "candy bar", :price => 1.20, :purchase_id => purchase.id })
    expect(purchase.products()).to eq([product1])
  end

  describe("#total") do
    it("returns the sum of an array") do
      purchase1 = Purchase.create({ :name => "Purchase", :product_ids => [] })
    end
  end


end
