# SimpleCov Settings
begin
  require 'simplecov'
  SimpleCov.start
rescue LoadError
  puts 'Coverage disabled, enable by installing simplecov'
end

# source
require_relative '../lib/structure_flatter'

# input resources
require_relative 'inputs/various_structures'
require_relative 'inputs/various_key_value_pairs'

# gems used
require 'rspec'
require 'awesome_print'
