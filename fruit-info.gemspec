# frozen_string_literal: false

require_relative 'lib/fruit/version'

Gem::Specification.new do |spec|
  spec.name          = 'fruit-info'
  spec.version       = FruitInfo::VERSION
  spec.authors       = ['Samuel Grasse-Haroldsen']
  spec.email         = ['sgrasseharoldsen@gmail.com']

  spec.summary       = 'A gem utilizing the fruityvice api'
  spec.description   = 'Gives information on the nutrional value of several fruits.'
  spec.homepage      = 'https://github.com/SamG-H/fruit-cli-gem'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = ['lib/cli.rb', 'lib/fruit.rb', 'lib/fruityvice_api.rb', 'config/environment.rb']
  spec.bindir        = 'bin'
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.executables << 'fruit-info'
  spec.add_dependency 'colorize', '~> 0.8'
  spec.add_dependency 'httparty', '~> 0.18'
  spec.add_dependency 'json', '~> 2.1'
  spec.add_dependency 'pry', '~> 0.10'
end
