class ExampleScraper
  
  attr_reader :html

  # url = "https://twitter.com/search?q=%22will%20be%20pooping%20bottles%22&src=typd&f=realtime"
  def initialize(url)
      url_file = open(url)
      @html = Nokogiri::HTML(url_file)
  end

  def example_method
    urls = []
    string_urls = html.search("a.tweet-timestamp").collect{|a|a["href"]}
    string_urls.each do |url|
      urls << ExampleModel.new(url)
    end
    urls
  end
  
end
