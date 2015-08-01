# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nerd_log/version'

Gem::Specification.new do |spec|
  spec.name          = "nerd_log"
  spec.version       = NerdLog::VERSION
  spec.authors       = ["Patrick Robertson"]
  spec.email         = ["patricksrobertson@gmail.com"]
  spec.summary       = %q{HTTP wrapper for WCL}
  spec.description   = %q{Quick and Dirty HTTP Wrapper for Warcraft Logs}
  spec.homepage      = "https://github.com/patricksrobertson/nerd_log"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware", "~> 0.10"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
