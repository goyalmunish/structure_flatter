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
  spec.homepage      = "http://www.linkedin.com/in/goyalmunish"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 0.9"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_dependency "awesome_print", "~> 1.2"
  spec.add_dependency "activesupport", "~> 4.0"
end
