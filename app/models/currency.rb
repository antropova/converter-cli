class Currency

  attr_accessor :name, :shortcut, :rate, :amount, :converted, :result_cur

  def initialize(input_array, rates)
    @amount = input_array[0]
    @shortcut = input_array[1]
    @result_cur = input_array[2]
    @rate = rates.rates[shortcut]
    @converted = rates.rates[result_cur] * self.to_usd
    @name = rates.countries[shortcut]
  end

  def to_usd
    amount / rate
  end
end