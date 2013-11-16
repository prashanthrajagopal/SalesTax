require_relative "./tax"
require_relative "./tax_factory"
require_relative "./sales_tax"
require_relative "./sales_tax_decorator"
require_relative "./import_tax_decorator"

class TaxCalculator
  def initialize(args)
    @product = args
  end

  def calculate_tax_rate
    if SalesTax.exempted(@product.name)
      if @product.name.include? "imported"
        ImportTax.new(Tax.new).get_rate
      else
        (Tax.new).get_rate
      end
    else
      if @product.name.include? "imported"
        (TaxFactory.all_taxes).round(2)
      else
        (SalesTax.new(Tax.new)).get_rate
      end
    end
  end
end
