module Parser
  def parse(input)
    CurrencyConverter.new(input).call
  rescue CurrencyNotFound
    puts Rainbow("Some error occured, please try again").red.bright
    run
  end  
end

class CurrencyNotFound < StandardError; end

class CurrencyConverter
  def self.new(input)
    case input
    when /^\w{3}$/
      FromCountryCode.new(input)
    when /^\d+\s\w{3}$/
      AmountWithCurrency.new(input)
    when /^\d+\s\w{3}\sto\s\w{3}$/i
      AmountWithCurrencyAndConversion.new(input)
    when /^\d+\s\w{3}\sto\s\w{3}\s\d{4}-\d{2}-\d{2}$/i 
      WithAmountAndDate.new(input)
    else
      raise CurrencyNotFound
    end
  end

end

class AmountWithCurrency
  attr_reader :input, :default_currency
  def initialize(input)
    @input = input
    @default_currency = "USD"
  end

  def call
    input_array = input.split(' ')
    amount = input_array[0]
    initial_cur = input_array[1]
    [amount.to_i, initial_cur.upcase, default_currency]
  end
end 

class AmountWithCurrencyAndConversion
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def call
    input_array = input.split(" ") 
    amount = input_array[0]
    initial_cur = input_array[1]
    result_cur = input_array[3] 
    [amount.to_i, initial_cur.upcase, result_cur.upcase]
  end
end 

class WithAmountAndDate
 attr_reader :input
 def initialize(input)
  @input = input
  end

  def call
    input_array = input.split(" ") 
    amount = input_array[0]
    initial_cur = input_array[1]
    result_cur = input_array[3]
    date = input_array[4]
    [amount.to_i, initial_cur.upcase, result_cur.upcase, date]
  end
end

class FromCountryCode
  attr_reader :input, :default_currency
  def initialize(input)
    @input = input
    @default_currency = "USD"
  end

  def call
    amount = 1
    [amount.to_i, input.upcase, default_currency]
  end
end