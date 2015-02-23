class ConverterCLI

  def initialize
    latest_url = "https://openexchangerates.org/api/latest.json?app_id=3fb2b129f6b64345a150612f6362b1fb"
    @rates = JSON.load(open(latest_url))
    @countries = JSON.parse( IO.read("./spec/fixtures/currency_country_names.json") )
  end

  def call
    puts "Welcome to Converter!"
    puts "Type 'help' for options."
    run
  end
    
  def get_user_input
    gets.chomp.strip
  end

  def run
    print "New search keyword: "
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      exit
    else
      search(input)
    end
    run
  end

  def search(input)
    # search_term = input.split(" ")[0]
    # puts "Your search term was #{search_term}, I am searching..."
    # url = "https://twitter.com/search?q=#{search_term}&src=typd&f=realtime"
    # tweet = ExampleScraper.new(url).example_method.sample
    # puts "Thank you for your patience. I found this on Twitter:"
    # puts tweet.example
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type 'list' to list currencies shortcuts (or countries)"
        # this will lead to another user input that's going to
        # prompt user to type in the country (match it with regex)
        # and give a short description of the country (wikipedia/)
    puts "Type a country name to search by country"
    # puts "Type anything else to search for a Tweet"
  end

end