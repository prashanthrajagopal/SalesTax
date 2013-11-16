require_relative "./tax_decerator.rb"

class SalesTax
  include TaxDecorator

  def get_rate
    @decorated.get_rate + 0.1
  end
end
