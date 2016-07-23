# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Exercise 48 & 49"
  spec.version       = '1.0'
  spec.authors       = ["Thomas Scanlon"]
  spec.email         = ["thomas.scanlon@outlook.com"]
  spec.summary       = %q{Exercises 48 and 49}
  spec.description   = %q{Exercises 48 and 49 from the Learn Ruby the Hard Way book.}
  spec.homepage      = "https://www.github.com/tbscanlon"
  spec.license       = "MIT"

  spec.files         = ['lib/ex48.rb']
  spec.executables   = ['bin/ex48']
  spec.test_files    = ['tests/test_ex48.rb', 'tests/test_parser.rb']
  spec.require_paths = ["lib"]
end
