# -*- encoding: utf-8 -*-
require File.expand_path('../lib/predicates/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Erol Fornoles"]
  gem.email         = ["erol.fornoles@gmail.com"]
  gem.description   = %q{Truth accessors for Ruby classes and models}
  gem.summary       = %q{Truth accessors for Ruby classes and models}
  gem.homepage      = "http://erol.github.com/predicates"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "predicates"
  gem.require_paths = ["lib"]
  gem.version       = Predicates::VERSION
end
