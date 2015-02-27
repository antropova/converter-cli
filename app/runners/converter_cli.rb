class ConverterCLI
  attr_reader :api

  def initialize
    @api = RatesAPI.new
  end

  include Parser

  def call
    puts "\nWelcome to " + Rainbow("Converter").yellow.bright
    puts "\nType " + Rainbow("help").cyan.bright + " for options or"
    run
  end
    
  def run
    puts "Type command: "
    input = gets.strip
    if input == "help"
      help
    elsif input == "exit"
      exit
    elsif input == "list"
      list
    else
      convert(input)
    end
    run
  end

  def convert(input)
    input = self.parse(input)
    if input[3]
      api.historical(input[3]) 
    else
      api.latest
    end
    cur = Currency.new(input, @api)
    print_result(cur)
  end

  def print_result(cur) 
    puts Rainbow("#{cur.amount} #{cur.name}(s) is #{cur.converted.round(3)} #{api.countries[cur.result_cur]}(s)").color("#FF66FF").bright
  end
  
  def help
    puts "Type " + Rainbow("exit").cyan.bright + " to exit"
    puts "Type " + Rainbow("help").cyan.bright + " to view this menu again"
    puts "Type "  + Rainbow("list").cyan.bright + " to list currencies names and shortcuts"
    puts "To convert currency please use the following format: "
    string = <<-EOF
    #{Rainbow("rub").cyan.bright}                       -> converts 1 Russian Ruble to US Dollars 
    #{Rainbow("10 rub").cyan.bright}                    -> converts 10 Russian Rubles to US Dollars
    #{Rainbow("20 rub to mdl").cyan.bright}             -> converts 20 Russian Rubles to Moldovan Leus
    #{Rainbow("20 rub to mdl YYYY-MM-DD").cyan.bright}  -> converts using the exchange rate from the specific date
    Input is case insensitive 
EOF
    puts string
  end

  def list
    api.countries.each do |shortcut, country|
      puts Rainbow("#{shortcut}").cyan.bright + ": #{country}"
    end
  end
end