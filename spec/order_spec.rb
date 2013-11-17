require "spec_helper"
require "order"
require "product"
require 'bigdecimal'

describe "Order" do
  before :each do
    # Case 1
    @product = Product.new(["The Rspec Book", BigDecimal('12.49')])
    @product1 = Product.new(["Music CD", BigDecimal('14.99')])
    @product2 = Product.new(["chocolate bar", BigDecimal('0.85')])
    # Case 2
    @product3 = Product.new(["imported chocolates", BigDecimal('10.00')])
    @product4 = Product.new(["imported perfume", BigDecimal('47.50')])
    # Case 3
    @product5 = Product.new(["perfume imported", BigDecimal('27.99')])
    @product6 = Product.new(["perfume local", BigDecimal('18.99')])
    @product7 = Product.new(["headache pills", BigDecimal('9.75')])
    @product8 = Product.new(["imported chocolates", BigDecimal('11.25')])
  end

  #### Should check if the order is created
  it "Should create an order object" do
    order = Order.new([@product, @product1, @product2], [1,1,1])
    order.should_not be_nil
  end

  #### Should calculate the correct sales tax
  it "Should calculate correct sales tax for each item in order for example - 1" do
    case_1 = Order.new([@product, @product1, @product2], [1,1,1])
    case_1.calculate_tax.should == [BigDecimal('0.00'), BigDecimal('1.50'), BigDecimal('0.00')]
  end

  it "Should calculate correct sales tax for each item in order for example - 2" do
    case_2 = Order.new([@product3, @product4], [1,1])
    case_2.calculate_tax.should == [BigDecimal('0.5'), BigDecimal('7.15')]
  end

  it "Should calculate correct sales tax for each item in order for example - 3" do
    case_3 = Order.new([@product5, @product6, @product7, @product8], [1,1,1,1])
    case_3.calculate_tax.should == [BigDecimal('4.20'), BigDecimal('1.90'), BigDecimal('0.00'), BigDecimal('0.60')]
  end

  #### Should calculate the correct price of product with tax
  it "Should calculate correct total price for each product for example - 1" do
    case_1 = Order.new([@product, @product1, @product2], [1,1,1])
    case_1.item_price_with_tax.should == [BigDecimal('12.49'), BigDecimal('16.49'), BigDecimal('0.85')]
  end

  it "Should calculate correct total price for each product for example - 2" do
    case_2 = Order.new([@product3, @product4], [1,1])
    case_2.item_price_with_tax.should == [BigDecimal('10.50'), BigDecimal('54.65')]
  end

  it "Should calculate correct total price for each product for example - 3" do
    case_3 = Order.new([@product5, @product6, @product7, @product8], [1,1,1,1])
    case_3.item_price_with_tax.should == [BigDecimal('32.19'), BigDecimal('20.89'), BigDecimal('9.75'), BigDecimal('11.85')]
  end

  #### Should calculate the sales tax total correctly
  it "Should calculate correct total the sales tax for example - 1" do
    case_1 = Order.new([@product, @product1, @product2], [1,1,1])
    case_1.sales_tax_total.should == BigDecimal('1.5')
  end

  it "Should calculate correct total the sales tax for example - 2" do
    case_2 = Order.new([@product3, @product4], [1,1])
    case_2.sales_tax_total.should == BigDecimal('7.65')
  end

  it "Should calculate correct total the sales tax for example - 3" do
    case_3 = Order.new([@product5, @product6, @product7, @product8], [1,1,1,1])
    case_3.sales_tax_total.should == BigDecimal('6.7')
  end

  #### Should calculate the order total correctly
  it "Should calculate correct total of the order for example - 1" do
    case_1 = Order.new([@product, @product1, @product2], [1,1,1])
    case_1.total.should == BigDecimal('29.83')
  end

  it "Should calculate correct total of the order for example - 2" do
    case_2 = Order.new([@product3, @product4], [1,1])
    case_2.total.should == BigDecimal('65.15')
  end

  it "Should calculate correct total of the order for example - 3" do
    case_3 = Order.new([@product5, @product6, @product7, @product8], [1,1,1,1])
    case_3.total.should == BigDecimal('74.68')
  end

end
