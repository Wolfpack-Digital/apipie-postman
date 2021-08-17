# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'apipie-postman'
  s.version     = '0.0.4'
  s.required_ruby_version = '~> 2.4'
  s.summary     = 'Generate Postman collection from apipie output.'
  s.description = "Use 'bundle exec apipie-postman' and 'rake apipie_postman' to generate the docs! More details on https://github.com/VictorMotogna/apipie-postman"
  s.authors     = ['Victor Motogna']
  s.email       = 'vmotogna@gmail.com'
  s.files       = ['lib/apipie-postman.rb']
  s.homepage    = 'https://github.com/VictorMotogna/apipie-postman'
  s.license     = 'MIT'
  s.executables << 'apipie-postman'
  s.add_dependency 'faraday', '~> 1.4', '>= 1.4.3'
  s.add_development_dependency 'pry', '~> 0.14.1'
  s.add_development_dependency 'rspec', '~> 3.10'
end
