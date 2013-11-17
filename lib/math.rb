Math.instance_eval do
  def self.round_with_precision(number, precision)
    (number / precision).ceil * precision
  end
end
