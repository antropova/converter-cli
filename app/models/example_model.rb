require_relative '../config/environment'

class ExampleModel

  attr_reader :url

  def initialize(url)
    @url = url
  end

end