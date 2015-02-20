class ExampleCLI

  def call
    puts "Welcome, what Twitter search word should I use?"
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
    search_term = input.split(" ")[0]
    puts "Your search term was #{search_term}, I am searching..."
    url = "https://twitter.com/search?q=#{search_term}&src=typd&f=realtime"
    tweet = ExampleScraper.new(url).example_method.sample
    puts "Thank you for your patience. I found this on Twitter:"
    puts tweet.example
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type anything else to search for a Tweet"
  end

end

