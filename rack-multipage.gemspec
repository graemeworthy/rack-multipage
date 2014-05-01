# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack-multipage/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-multipage"
  spec.version       = Rack::Multipage::VERSION
  spec.authors       = ["Graeme Worthy"]
  spec.email         = ["graeme@workben.ch"]
  spec.description   = %q{Rack Middleware that creates a series of thumbnail views of multiple pages in your application.}
  spec.summary       = %q{Display iframed versions of multiple pages of your app.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "rack"
end
