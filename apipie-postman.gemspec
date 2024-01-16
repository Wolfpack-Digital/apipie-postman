# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'apipie-postman'
  s.version     = '2.0.0'
  s.required_ruby_version = '>= 3.0.0'
  s.summary     = 'Generate Postman collection from apipie output.'
  s.description = "Use 'bundle exec apipie-postman' and 'rake apipie_postman' to generate the docs!"
  s.authors     = ['Victor Motogna']
  s.email       = 'vmotogna@gmail.com'
  s.files       = ['lib/apipie-postman.rb']
  s.homepage    = 'https://github.com/VictorMotogna/apipie-postman'
  s.license     = 'MIT'
  s.executables << 'apipie-postman'
  s.add_runtime_dependency 'faraday', '~> 2.7', '>= 2.7.12'
  s.metadata['rubygems_mfa_required'] = 'true'
end
