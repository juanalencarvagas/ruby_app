# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'
require 'factory_bot'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  RSpec.configure do |c|
    c.include FactoryBot::Syntax::Methods

    c.before(:suite) do
      FactoryBot.find_definitions
    end
  end

  SimpleCov.start
end
