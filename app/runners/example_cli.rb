class ExampleCLI

  def call
    puts "Welcome, what would you like to search Twitter for?"
    url = 'https://twitter.com/search?q=#{search_term}&src=typd&f=realtime'
    urls = ExampleScraper.new(url).example_method
    puts "Welcome to the example CLI."
    puts "Type help to see what you can do!"
  end
    
  def get_user_input
    gets.chomp.strip
  end

  def run
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      break
    else
      url = "https://twitter.com/search?q=#{input}&src=typd&f=realtime"
      tweet = ExampleScraper.new(url).example_method
    end
    run
  end
  
  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type anything else to search for a Tweet"
  end

end