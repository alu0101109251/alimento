# The lines added to coverall service
require 'coveralls'
Coveralls.wear!

require 'bundler/setup'
require 'alimento'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expose_dsl_globally = true
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
