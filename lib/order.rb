require_relative './tax_calculator'
require_relative './math'
require 'bigdecimal'

class Order
  def initialize(args, quant)
    @products = args
    @quantities = quant
  end

  def calculate_tax
    product_tax = []
    @products.each do |product|
      tc = TaxCalculator.new(product)
      tax_rate = tc.calculate_tax_rate
      product_tax << (Math.round_with_precision((product.price * tax_rate), BigDecimal('0.05'))).round(2)
    end
    product_tax
  end

  def item_price_with_tax
    item_price = []
    @products.each_with_index do |product, index|
      item_price << ((product.price + calculate_tax[index]) * @quantities[index]).round(2)
    end
    item_price
  end

  def sales_tax_total
    (calculate_tax.inject(:+)).round(2)
  end

  def total
    (item_price_with_tax.inject(:+)).round(2)
  end

  def order_receipt
    @products.each_with_index do |product, index|
      puts "#{@quantities[index]} #{product.name} at #{product.price.to_f}\t=>\t#{item_price_with_tax[index].to_f}"
    end
    puts "Sales Tax total\t=>\t#{sales_tax_total.to_f}"
    puts "Order Total\t=>\t#{total.to_f}"
  end
end
