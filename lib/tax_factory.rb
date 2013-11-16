require_relative "./tax"
require_relative "./sales_tax_decorator"
require_relative "./import_tax_decorator"

class TaxFactory
  def self.all_taxes
    ImportTax.new(SalesTax.new(Tax.new)).get_rate
  end
end
