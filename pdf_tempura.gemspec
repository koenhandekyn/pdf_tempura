# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pdf_tempura/version'

Gem::Specification.new do |spec|
  spec.name          = "pdf_tempura"
  spec.version       = PdfTempura::VERSION
  spec.authors       = ["Dane Natoli, Koen Handekyn"]
  spec.email         = ["dnatoli@payrollhero.com, koen@handekyn.com"]
  spec.description   = %q{A gem for overlaying text and other fields onto PDF templates using Prawn.}
  spec.summary       = %q{A gem for overlaying text and other fields onto PDF templates using Prawn.}
  spec.homepage      = "https://github.com/allcrux/pdf_tempura"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "prawn"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
