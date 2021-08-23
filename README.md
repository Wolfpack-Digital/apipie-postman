# apipie-postman [![Gem Version](https://badge.fury.io/rb/apipie-postman.svg)](https://badge.fury.io/rb/apipie-postman)

## Description

`apipie-postman` is a Ruby gem that automatically generates a Postman collection based on your apipie json output.

The main reason we built this was because we were often in need for a Postman collection with the APIs we designed, but the work seemed to be duplicate. Also, the collection is hard to maintain and many times left incomplete.

## Installation

* find the gem on https://rubygems.org/gems/apipie-postman
* add the gem in `group :development, :test`
* generate a Postman API key; details [here](https://learning.postman.com/docs/developer/intro-api/)
* add an initializer file to `config/initializers/apipie_postman.rb`:
```ruby
ApipiePostman.configure do |config|
  config.postman_api_key = 'your_postman_api_key'
  config.postman_collection_name = 'Your collection name'
  config.base_url = 'localhost:3000' # the base_url that you want in your postman collection
end
```
* run `bundle exec apipie-postman`

## Usage

* running `bundle exec apipie-postman` will create the apipie_postman.rake file
* run `bundle exec rake apipie_postman` to run the task and generate docs

## Testing

The gem uses [Rspec](https://rubygems.org/gems/rspec) for testing. In order to make sure all tests are running, run `bundle install` and `bundle exec rspec spec/file_to_test.rb` or `bundle exec rspec spec/*` (to run all files).

## Want to contribute?

![](https://img.shields.io/github/issues/VictorMotogna/apipie-postman?style=flat-square)\
Check out [`CONTRIBUTING.md`](CONTRIBUTING.md).
