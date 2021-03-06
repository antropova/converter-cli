class RatesAPI 
  attr_accessor :rates, :countries

  def initialize
    @json_rates = JSON.parse( IO.read("./spec/fixtures/rates.json") )
    # @url = "https://openexchangerates.org/api/latest.json?app_id=3fb2b129f6b64345a150612f6362b1fb"
    # @json_rates = JSON.load(open(@url))
    @rates = @json_rates["rates"]
    @countries = JSON.parse( IO.read("./spec/fixtures/currency_country_names.json") )
  end

  def historical(date)
    @url = "https://openexchangerates.org/api/historical/#{date}.json?app_id=3fb2b129f6b64345a150612f6362b1fb"    
    begin 
      json_dates = JSON.load(open(@url))
      @rates = json_dates["rates"]
    rescue
      puts Rainbow("Sorry, no info found for that date, using today's rate instead..." ).red.bright
      @rates
    end
  end

  def latest
    @json_rates = JSON.parse( IO.read("./spec/fixtures/rates.json") )
    # @url = "https://openexchangerates.org/api/latest.json?app_id=3fb2b129f6b64345a150612f6362b1fb"
    # @json_rates = JSON.load(open(@url))
    @rates = @json_rates["rates"]
  end
end
