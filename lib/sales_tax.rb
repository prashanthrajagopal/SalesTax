require 'active_support/core_ext/string'
require_relative './order'
require_relative './product'

class SalesTax
  class << self
    def exempted(item)
      item_arr = item.split
      exempted_list = ["chocolate","pill","medicine","book", "food"]
      item_arr.any? {|type| exempted_list.include?(type.singularize) }
    end

    def split_input(line)
      regex = /^(\d+) (.+) at \$?(\d.+)$/
      matches, quantity, name, price = regex.match(line).to_a
      [quantity, name, price]
    end

    def calculate(inputs)
      products = []
      inputs.each do |input|
        quantity, name, price = split_input(input)
        products << Product.new([name, price])
      end
      order = Order.new products
      order.order_receipt
    end
  end
end
