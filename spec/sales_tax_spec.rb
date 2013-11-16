require 'sales_tax'

describe "sales tax" do

  it "should should split input" do
    SalesTax.split_input("1 book at 12.49") == ["1", "book", "12.49"]
  end

  it "should should split input" do
    SalesTax.split_input("1 music CD at 14.99") == ["1", "music CD", "14.99"]
  end

  it "should should split input" do
    SalesTax.split_input("1 chocolate bar at 0.85") == ["1", "chocolate bar", "0.85"]
  end

  it "should should split input" do
    SalesTax.split_input("1 imported box of chocolates at 10.00") == ["1", "imported box of chocolates", "10.00"]
  end

  it "should should split input" do
    SalesTax.split_input("1 imported bottle of perfume at 47.50") == ["1", "imported bottle of perfume", "47.50"]
  end

  it "should should split input" do
    SalesTax.split_input("1 imported bottle of perfume at 27.99") == ["1", "imported bottle of perfume", "27.99"]
  end

  it "should should split input" do
    SalesTax.split_input("1 bottle of perfume at 18.99") == ["1", "bottle of perfume", "18.99"]
  end

  it "should should split input" do
    SalesTax.split_input("1 packet of headache pills at 9.75") == ["1", "packet of headache pills", "9.75"]
  end

  it "should should split input" do
    SalesTax.split_input("1 box of imported chocolates at 11.25") == ["1", "box of imported chocolates", "11.25"]
  end

end
