require_relative "../lib/order"
require_relative "../lib/product"

describe "Order" do
  before :each do
    # Case 1
    @product = Product.new(["The Rspec Book", 12.49])
    @product1 = Product.new(["Music CD", 14.99])
    @product2 = Product.new(["chocolate bar", 0.85])
    # Case 2
    @product3 = Product.new(["imported chocolates", 10])
    @product4 = Product.new(["imported perfume", 47.50])
    # Case 3
    @product5 = Product.new(["perfume imported", 27.99])
    @product6 = Product.new(["perfume local", 18.99])
    @product7 = Product.new(["headache pills", 9.75])
    @product8 = Product.new(["imported chocolates", 11.25])
  end

  #### Should check if the order is created
  it "should create an order object" do
    order = Order.new([@product, @product1, @product2], [1,1,1])
    order.should_not be_nil
  end

  #### Should calculate the correct sales tax
  it "should calculate correct sales tax for each item in order" do
    case_1 = Order.new([@product, @product1, @product2], [1,1,1])
    case_1.calculate_tax.should == [0.0, 1.5, 0.0]
  end

  it "should calculate correct sales tax for each item in order" do
    case_2 = Order.new([@product3, @product4], [1,1])
    case_2.calculate_tax.should == [0.5, 7.15]
  end

  it "should calculate correct sales tax for each item in order" do
    case_3 = Order.new([@product5, @product6, @product7, @product8], [1,1,1,1])
    case_3.calculate_tax.should == [4.20, 1.90, 0.0, 0.60]
  end

  #### Should calculate the correct price of product with tax
  it "should calculate correct total price for each product" do
    case_1 = Order.new([@product, @product1, @product2], [1,1,1])
    case_1.item_price_with_tax.should == [12.49, 16.49, 0.85]
  end

  it "should calculate correct total price for each product" do
    case_2 = Order.new([@product3, @product4], [1,1])
    case_2.item_price_with_tax.should == [10.50, 54.65]
  end

  it "should calculate correct total price for each product" do
    case_3 = Order.new([@product5, @product6, @product7, @product8], [1,1,1,1])
    case_3.item_price_with_tax.should == [32.19, 20.89, 9.75, 11.85]
  end

  #### Should calculate the sales tax total correctly
  it "should calculate correct total the sales tax" do
    case_1 = Order.new([@product, @product1, @product2], [1,1,1])
    case_1.sales_tax_total.should == 1.5
  end

  it "should calculate correct total the sales tax" do
    case_2 = Order.new([@product3, @product4], [1,1])
    case_2.sales_tax_total.should == 7.65
  end

  it "should calculate correct total the sales tax" do
    case_3 = Order.new([@product5, @product6, @product7, @product8], [1,1,1,1])
    case_3.sales_tax_total.should == 6.7
  end

  #### Should calculate the order total correctly
  it "should calculate correct total of the order" do
    case_1 = Order.new([@product, @product1, @product2], [1,1,1])
    case_1.total.should == 29.83
  end

  it "should calculate correct total of the order" do
    case_2 = Order.new([@product3, @product4], [1,1])
    case_2.total.should == 65.15
  end

  it "should calculate correct total of the order" do
    case_3 = Order.new([@product5, @product6, @product7, @product8], [1,1,1,1])
    case_3.total.should == 74.68
  end

end
