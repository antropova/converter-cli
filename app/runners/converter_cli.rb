# require 'json'
# require 'pry'

class ConverterCLI

  def initialize
    # latest_url = "https://openexchangerates.org/api/latest.json?app_id=3fb2b129f6b64345a150612f6362b1fb"
    # @rates = JSON.load(open(latest_url))
    json_rates = JSON.parse( IO.read("./spec/fixtures/rates.json") )
    @rates = json_rates["rates"]
    @countries = JSON.parse( IO.read("./spec/fixtures/currency_country_names.json") )
  end

  def call
    puts "Welcome to Converter!"
    puts "Type 'help' for options."
    run
  end
    
  def run
    puts "Insert currency name"
    input = get_user_input
    parse(input)
    run
  end
  
  def get_user_input
    gets.chomp
  end
 
  def parse(input)
    if @rates.keys.include?(input)
      print_rate(input)
    elsif input =~ /to\s\w{3}\$/
      do_math(input)
    elsif input =~ /^\d+/
      do_math(input)
    end
  end

  def print_rate(input)
    puts "1 #{input} is #{1/@rates[input]} USD"
    puts "1 USD is #{@rates[input]} #{input}"
  end

  def do_math(input)
    input_array = input.split(" ")
    if input_array.size == 2
      convert = input_array[0].to_i / @rates[input_array[1]]
      puts "#{input_array[0]} #{input_array[1]} is #{convert.round(2)} #{input_array[2]} USD"
    elsif input_array.size == 4
      usd_amount = input_array[0].to_i / @rates[input_array[1]]
      cur_amount = usd_amount * @rates[input_array[3]]
      puts "#{input_array[0]} #{input_array[1]} is #{cur_amount.round(2)} #{input_array[3]}"
    else
      puts "Error!"
    end
  end
  
  def print_result
    puts 'rate'
  end

end

