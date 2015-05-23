lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/evaluate/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-evaluate'
  spec.version       = Ruboty::Evaluate::VERSION
  spec.authors       = ['kaihar4']
  spec.email         = ['kaihar4@gmail.com']
  spec.summary       = 'Ruboty handler to evaluate a command'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/kaihar4/ruboty-evaluate'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
