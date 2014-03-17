# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiny-flash/version'

Gem::Specification.new do |spec|
  spec.name          = "tiny-flash"
  spec.version       = Tiny::Flash::VERSION
  spec.authors       = ["Rabsztok"]
  spec.email         = ["rabsztok@gmail.com"]
  spec.summary       = %q{Simplified redirection with flash message for Rails applications}
  spec.description   = %q{Couple of methods which will clean up your controllers code.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
