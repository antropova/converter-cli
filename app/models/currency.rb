class Currency

  attr_reader :name, :shortcut, :rate, :amount

  def initialize(shortcut)
    json_rates = JSON.parse( IO.read("./spec/fixtures/rates.json") )
    @countries = JSON.parse( IO.read("./spec/fixtures/currency_country_names.json") )
    @rate = json_rates["rates"][shortcut]
    @shortcut = shortcut
    @name = @countries[shortcut]
    @amount = 1
  end

  def to_usd
    # 25 RUB 
    amount.to_f / rate
    # total.round(2)
  end

  def convert_to(shortcut)
    # 120 RUB to MDL
    self.to_usd * shortcut.rate
    # total.round(2)
  end

end

  # def print_rate(shortcut)
  #   usd = (1/@rates[shortcut]).round(2)
  #   rate = @rates[shortcut].round(2)
  #   puts "\n1 #{shortcut} is #{usd} USD"
  #   puts "1 USD is #{rate} #{shortcut}\n\n"
  # end

  # def do_math(input)
  #   input_array = input.split(" ")
  #   if input_array.size == 2
  #     convert = input_array[0].to_i / @rates[input_array[1]]
  #     puts "#{input_array[0]} #{input_array[1]} is #{convert.round(2)} #{input_array[2]} USD"
  #   elsif input_array.size == 4
  #     usd_amount = input_array[0].to_i / @rates[input_array[1]]
  #     cur_amount = usd_amount * @rates[input_array[3]]
  #     puts "#{input_array[0]} #{input_array[1]} is #{cur_amount.round(2)} #{input_array[3]}"
  #   else
  #     puts "Error!"
  #   end
  # end





