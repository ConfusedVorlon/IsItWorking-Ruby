# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'is_it_working_info/version'

Gem::Specification.new do |spec|
  spec.name          = "is_it_working_info"
  spec.version       = IsItWorkingInfo::VERSION
  spec.authors       = ["Rob Jonson"]
  spec.email         = ["rob@hobbyistsoftware.com"]

  spec.summary       = %q{Simple wrapper to monitor background task running and duration with IsItWorking.info}
  spec.description   = %q{IsItWorking.info provides a service to monitor scripts. This wrapper provides simple methods to time scritps, or to report succesful running}
  spec.homepage      = "https://github.com/ConfusedVorlon/IsItWorking-Ruby"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'

  spec.add_development_dependency "bundler", ">= 2.2.10"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.0"
end
