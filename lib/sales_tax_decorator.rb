require_relative "./tax_decerator.rb"

class SalesTax
  include TaxDecorator

  def get_rate
    @decorated.get_rate + BigDecimal('0.10')
  end
end
