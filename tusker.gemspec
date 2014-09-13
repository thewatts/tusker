# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tusker/version'

Gem::Specification.new do |spec|
  spec.name          = "tusker"
  spec.version       = Tusker::VERSION
  spec.authors       = "Nathaniel Watts"
  spec.email         = "reg@nathanielwatts.com"
  spec.summary       = "Command line interface to use Evernote"
  spec.description   = "Tusker is a command line interface to create notes with Evernote."
  spec.homepage      = "http://github.com/thewatts/tusker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "evernote_oauth"
  spec.add_dependency "redcarpet"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
end
