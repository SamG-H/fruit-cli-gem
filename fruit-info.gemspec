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
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.executables << 'fruit-info'
  spec.add_dependency 'colorize'
  spec.add_dependency 'httparty'
  spec.add_dependency 'json'
  spec.add_dependency 'pry'
end
