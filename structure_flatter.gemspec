# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'structure_flatter/version'

Gem::Specification.new do |spec|
  spec.name          = "structure_flatter"
  spec.version       = StructureFlatter::VERSION
  spec.authors       = ["Munish Goyal"]
  spec.email         = ["munishapc@gmail.com"]
  spec.description   = %q{Flattens hash-array structures by removing redundant information.}
  spec.summary       = %q{Flattens Hash Array Structures}
  spec.homepage      = "https://github.com/goyalmunish/structure_flatter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features|autotest)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake", ">= 0.9"
  spec.add_development_dependency "awesome_print", ">= 1.2"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "autotest"
  spec.add_development_dependency "simplecov"
  spec.add_dependency "activesupport", "~> 4.0"
  spec.required_ruby_version = '>=1.9'
end
