require_relative '../config/environment'
require_relative '../app/concerns/findable.rb'
require_relative '../app/models/artist.rb'
require_relative '../app/models/genre.rb'
require_relative '../app/models/song.rb'
require_relative '../app/models/library_parser.rb'
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'default'
end
 
