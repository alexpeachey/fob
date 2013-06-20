# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fob/version'

Gem::Specification.new do |spec|
  spec.name          = "fob"
  spec.version       = Fob::VERSION
  spec.authors       = ["Alex Peachey"]
  spec.email         = ["alex.peachey@gmail.com"]
  spec.description   = %q{Form OBjects made easy.}
  spec.summary       = %q{Don't bulk up your models or controllers. Stay away from accepts_nested_attributes_for. Put form logic where it belongs, in a FOB!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "virtus"
  spec.add_development_dependency "activemodel"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
