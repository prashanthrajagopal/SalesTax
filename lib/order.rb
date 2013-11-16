require_relative './tax_calculator'

Math.class_eval do
  define_method(:round_nearest_5_cents, ->{ (self / 0.05).ceil * 0.05 })
end

class Order
  def initialize(args, quant)
    @products = args
    @quantities = quant
  end

  def round_nearest_5_cents(number)
    (number.to_f / 0.05).ceil * 0.05
  end

  def calculate_tax
    product_tax = []
    @products.each do |product|
      tc = TaxCalculator.new(product)
      tax_rate = tc.calculate_tax_rate
      product_tax << (round_nearest_5_cents(product.price * tax_rate.to_f)).round(2)
    end
    product_tax
  end

  def item_price_with_tax
    item_price = []
    @products.each_with_index do |product, index|
      item_price << ((product.price + calculate_tax[index].to_f) * @quantities[index]).round(2)
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
      puts "#{@quantities[index]} #{product.name}\t=>\t#{item_price_with_tax[index]}"
    end
    puts "Sales Tax total\t=>\t#{sales_tax_total}"
    puts "Order Total\t=>\t#{total}"
  end
end
