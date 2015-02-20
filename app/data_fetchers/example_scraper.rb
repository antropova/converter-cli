class ExampleScraper

  attr_reader :html

  def initialize(url)
    @html = Nokogiri::HTML(open(url))
  end

  def example_method
    tweets = html.search("p.tweet-text").collect { |p| p.text }
    tweets.each_with_object([]) do |tweet, result|
      result << ExampleModel.new(tweet)
    end
  end

end
