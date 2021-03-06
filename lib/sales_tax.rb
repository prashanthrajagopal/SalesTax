require 'active_support/core_ext/string'
require_relative './order'
require_relative './product'
require 'bigdecimal'

EXEMPTED_LIST = ["chocolate","pill","medicine","book", "food"]

class SalesTax
  class << self
    def exempted(item)
      item_arr = item.split
      item_arr.any? {|type| EXEMPTED_LIST.include?(type.singularize.downcase) }
    end

    def split_input(line)
      regex = /^(\d+) (.+) at \$?(\d.+)$/
      matches, quantity, name, price = regex.match(line).to_a
      [quantity, name, price]
    end

    def calculate(inputs)
      products = []
      quantities = []
      inputs.each do |input|
        quantity, name, price = split_input(input)
        quantities << quantity.to_i
        products << Product.new([name, BigDecimal(price)])
      end
      order = Order.new(products, quantities)
      order.order_receipt
    end
  end
end
