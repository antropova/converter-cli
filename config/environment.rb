require 'bundler/setup'
Bundler.require(:default, :development)

Dir[File.join(File.dirname(__FILE__), "../lib/concerns", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/data_fetchers", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/runners", "*.rb")].each {|f| require f}

require "open-uri"
require "json"

