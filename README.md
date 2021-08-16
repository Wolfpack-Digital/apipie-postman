# apipie-postman

## Installation

* find the gem on https://rubygems.org/gems/apipie-postman
* add an initializer file to `config/initializers/apipie_postman.rb`:
```ruby
# frozen_string_literal: true

ApipiePostman.configure do |config|
  config.postman_api_key = 'your_postman_api_key'
  config.postman_collection_name = 'Your collection name'
  config.base_url = 'localhost:3000' # the base_url that you want in your postman collection
end

```
* run `bundle exec apipie-postman`
* the executable will create the `apipie_postman.rake` file
* run `rake apipie_postman` to run the task and generate docs

## Known issues

* each time you run, a new Postman folder will be created
