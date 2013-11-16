require_relative "./tax"

class ImportTax
  include TaxDecorator

  def get_rate
    @decorated.get_rate + 0.05
  end
end
