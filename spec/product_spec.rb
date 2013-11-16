require '../lib/product'

describe "Product Model" do
  it "should create a product" do
    p = Product.new(["The Rspec Book", 12.49])
    p.should_not be_nil
  end

  it "should not create a product" do
    p = Product.new([])
    p.name.should be_nil
    p.price.should be_nil
  end
end
