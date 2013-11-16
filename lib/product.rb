
class Product
  attr_accessor :name, :price
  def initialize(args)
    if !args.empty?
      @name, @price = args
    else
      nil
    end
  end
end
