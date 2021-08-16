Gem::Specification.new do |s|
  s.name        = 'apipie-postman'
  s.version     = '0.0.2'
  s.summary     = 'Generate Postman collection from apipie output.'
  s.description = "Generate Postman collection from apipie output.
                  Use 'bundle exec apipie-postman' and 'rake apipie_postman' to generate the docs!"
  s.authors     = ['Victor Motogna']
  s.email       = 'vmotogna@gmail.com'
  s.files       = ['lib/apipie-postman.rb']
  s.homepage    = 'https://rubygems.org/gems/apipie-postman'
  s.license     = 'MIT'
  s.executables << 'apipie-postman'
  s.add_dependency 'faraday', '~> 1.4', '>= 1.4.3'
end
