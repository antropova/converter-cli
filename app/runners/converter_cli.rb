class ConverterCLI

  def call
    puts "\nWelcome to Converter!"
    puts "\nType 'help' for options.\n\n"
    run
  end
    
  def run
    puts "Please type in a currency shortcut"
    input = gets.chomp.upcase
    if input == "HELP"
      help
    elsif input == "EXIT"
      exit
    elsif input == "LIST"
      list
    end
    convert(input)
    run
  end

  def convert(input)
    input = parse(input)   # [1, rub, usd]
    # implement pretty print
  end

  def parse(input)
    case_1 = /^\w{3}$/
    case_2 = /^\d+\s\w{3}$/
    case_3 = /^\d+\s\w{3}\sto\s\w{3}$/
    if input =~ case_1
      amount = 1
      initial_cur = input
      result_cur = "usd"
    elsif input =~ case_2 || input =~ case_3
      input_array = input.split(' ')
      amount = input_array[0]
      initial_cur = input_array[1]
      input_array[3] ? result_cur = input_array[3] : result_cur = 'usd'
    else 
      p "Some error occured, please try again"
      run
    end
    [amount.to_i, initial_cur.upcase, result_cur.upcase]
  end 
  
  def help
    puts "\nType 'exit' to exit"
    puts "\nType 'help' to view this menu again".red
    puts "\nType 'list' to list currencies names and shortcuts"
    puts "\nTo get the currency rate please type in the currency shortcut, e.g EUR"
    puts "\nTo convert currency please use the following format '34 EUR to USD'"
    puts 
  end

  def list
    @countries.each do |shortcut, country|
      puts "#{shortcut}: #{country}"
    end
  end
end


  # def initialize
  #   # latest_url = "https://openexchangerates.org/api/latest.json?app_id=3fb2b129f6b64345a150612f6362b1fb"
  #   # @rates = JSON.load(open(latest_url))
  # end

# def parse(input)
  #   if @rates.keys.include?(input)
  #     print_rate(input)
  #   elsif input =~ /to\s\w{3}\$/i
  #     do_math(input)
  #   elsif input =~ /^\d+/
  #     do_math(input)
  #   end
  # end


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
