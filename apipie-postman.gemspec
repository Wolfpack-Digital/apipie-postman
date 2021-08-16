Gem::Specification.new do |s|
  s.name        = 'apipie-postman'
  s.version     = '0.0.3'
  s.summary     = 'Generate Postman collection from apipie output.'
  s.description = "Use 'bundle exec apipie-postman' and 'rake apipie_postman' to generate the docs! More details on https://github.com/VictorMotogna/apipie-postman"
  s.authors     = ['Victor Motogna']
  s.email       = 'vmotogna@gmail.com'
  s.files       = ['lib/apipie-postman.rb']
  s.homepage    = 'https://github.com/VictorMotogna/apipie-postman'
  s.license     = 'MIT'
  s.executables << 'apipie-postman'
  s.add_dependency 'faraday', '~> 1.4', '>= 1.4.3'
end
