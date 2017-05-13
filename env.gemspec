# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'env/version'

Gem::Specification.new do |spec|
  spec.name          = "env"
  spec.version       = Env::VERSION
  spec.authors       = ["Adam Sumner"]
  spec.email         = ["adam@gojilabs.com"]

  spec.summary       = %q{Set `APP_ENV` variable to desired project environment (e.g. test, staging, production, development, demo).}
  spec.description   = %q{We needed a second dimension to handle the situations where staging needs to be treated differently from production and where testing needs to be treated differently from development. `RAILS_ENV` and `RACK_ENV` are too general. In most cases staging and production should behave identically, but for those situations where they do not (e.g. database seeding, web scraping/API scraping), set the `APP_ENV` variable and use `Env.staging?`.}
  spec.homepage      = "http://www.gojilabs.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 12.0"
end
