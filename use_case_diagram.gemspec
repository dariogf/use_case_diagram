# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'use_case_diagram/version'

Gem::Specification.new do |spec|
  spec.name          = "use_case_diagram"
  spec.version       = UseCaseDiagram::VERSION
  spec.authors       = ["Dario Guerrero"]
  spec.email         = ["dariogf@gmail.com"]
  spec.description   = %q{A gem to generate user cases in UML using dot}
  spec.summary       = %q{A gem to generate user cases in UML using dot}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib","lib/use_case_diagram"]
  
  spec.add_runtime_dependency(%q<treetop>, ["= 1.4.12"])
  

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
