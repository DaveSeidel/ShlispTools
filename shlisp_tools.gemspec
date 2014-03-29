# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shlisp_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "shlisp_tools"
  spec.version       = ShlispTools::VERSION
  spec.authors       = ["Dave Seidel"]
  spec.email         = ["dave.seidel@gmail.com"]
  spec.description   = %q{shtool, shlerb, the Scale and Ratio classes, and the Scales and Shnth modules}
  spec.summary       = %q{Tools for shlisp/shnth users.}
  spec.homepage      = "http://gthub.com/DaveSeidel"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
