# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ex47"
  spec.version       = '1.0'
  spec.authors       = ["Thomas Scanlon"]
  spec.email         = ["thomas.scanlon@outlook.com"]
  spec.summary       = %q{Exercise 47}
  spec.description   = %q{Exercise 47 from Learn Ruby the Hard Way}
  spec.homepage      = "https://www.github.com/tbscanlon"
  spec.license       = "MIT"

  spec.files         = ['lib/ex47.rb']
  spec.executables   = ['bin/ex47']
  spec.test_files    = ['tests/test_ex47.rb']
  spec.require_paths = ["lib"]
end
