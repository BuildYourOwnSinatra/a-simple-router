# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'a-simple-router/version'

Gem::Specification.new do |spec|
  spec.name          = "a-simple-router"
  spec.version       = ASimpleRouter::VERSION
  spec.authors       = ["K-2052"]
  spec.email         = ["k@2052.me"]
  spec.summary       = %q{A very simple router}
  spec.homepage      = "https::/github.com/BuildYourOwnSinatra/a-very-simple-router"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rack'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
