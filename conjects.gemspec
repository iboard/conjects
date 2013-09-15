# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'conjects/version'

Gem::Specification.new do |spec|
  spec.name          = "conjects"
  spec.version       = Conjects::VERSION
  spec.authors       = ["Andi Altendorfer"]
  spec.email         = ["andi@iboard.cc"]
  spec.description   = %q{Connected Ruby Objects}
  spec.summary       = %q{Stores and connects Ruby objects using PStore files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "zeus"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "interactive_editor"
  spec.add_development_dependency "awesome_print"

end
