# -*- encoding : utf-8 -*-

require 'simplecov'

SimpleCov.start do
  add_filter 'spec/support/matchers'
  add_filter 'spec/support/warning_suppressor'
  add_filter 'spec/spec_helper'
  add_group "App", 'app/'
  add_group "Library", 'lib/'
end

include Conjects
require "examples/family.rb"
require "examples/school.rb"


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
