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
    puts "Type in command: "
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
    cur = Currency.new(input, rates)
    print_result(cur)
  end

  def print_result(cur) 
    puts Rainbow("#{cur.amount} #{cur.name}(s) is #{cur.converted.round(3)} #{rates.countries[cur.result_cur]}(s)").color("#FF66FF").bright
  end
  
  def help
    puts "Type " + Rainbow("exit").cyan.bright + " to exit"
    puts "Type " + Rainbow("help").cyan.bright + " to view this menu again"
    puts "Type "  + Rainbow("list").cyan.bright + " to list currencies names and shortcuts"
    puts "To convert currency please use the following format: "
    string = <<-EOF
    #{Rainbow("rub").cyan.bright}            -> converts 1 Russian Ruble to US Dollars 
    #{Rainbow("10 rub").cyan.bright}         -> converts 10 Russian Rubles to US Dollars
    #{Rainbow("20 rub to mdl").cyan.bright}  -> converts 20 Russian Rubles to Moldovan Leus
    Input is case insensitive 
EOF
    puts string
  end

  def list
    rates.countries.each do |shortcut, country|
      puts Rainbow("#{shortcut}").cyan.bright + ": #{country}"
    end
  end
end