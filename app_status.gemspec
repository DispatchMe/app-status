# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_status/version'

Gem::Specification.new do |spec|
  spec.name          = "app-status"
  spec.version       = AppStatus::VERSION
  spec.authors       = ["Serg Tkachenko"]
  spec.email         = ["creeonix@gmail.com"]
  spec.summary       = %q{Simple app satus report}
  spec.description   = %q{Very simple app services status report for rails, sinatra or rack}
  spec.homepage      = "https://github.com/DispatchMe/app-status"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
