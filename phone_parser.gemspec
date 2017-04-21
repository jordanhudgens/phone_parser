# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phone_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "phone_parser"
  spec.version       = PhoneParser::VERSION
  spec.authors       = ["Jordan Hudgens"]
  spec.email         = ["jordan@wow.com"]

  spec.summary       = %q{Enables parsing of phone numbers, including country code validations.}
  spec.description   = %q{The phone_parser gem allows programs to strip out formatting of phone numbers. This allows a program to accept any valid phone number in any format and parse it for universal storage.}
  spec.homepage      = "https://github.com/jordanhudgens/phone_parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
