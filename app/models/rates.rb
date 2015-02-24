class Rates # json object
  attr_reader :rates, :countries

  def initialize
    # json_rates = JSON.parse( IO.read("./spec/fixtures/rates.json") )
    latest_url = "https://openexchangerates.org/api/latest.json?app_id=3fb2b129f6b64345a150612f6362b1fb"
    json_rates = JSON.load(open(latest_url))
    @rates = json_rates["rates"]
    @countries = JSON.parse( IO.read("./spec/fixtures/currency_country_names.json") )
  end
end