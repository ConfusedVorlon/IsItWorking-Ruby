# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'is_it_working/version'

Gem::Specification.new do |spec|
  spec.name          = "is_it_working"
  spec.version       = IsItWorking::VERSION
  spec.authors       = ["Rob Jonson"]
  spec.email         = ["rob@hobbyistsoftware.com"]

  spec.summary       = %q{Simple wrapper to monitor background task running and duration with IsItWorking.info}
  spec.description   = %q{IsItWorking.info provides a service to monitor scripts. This wrapper provides simple methods to time scritps, or to report succesful running}
  spec.homepage      = "https://IsItWorking.info"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
