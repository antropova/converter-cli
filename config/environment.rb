Dir[File.join(File.dirname(__FILE__), "../lib/concerns", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/models", "*.rb")].each {|f| require f}
