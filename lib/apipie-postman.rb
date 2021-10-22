# frozen_string_literal: true

require 'json'
require 'faraday'

module ApipiePostman
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  # Configuration class for gem
  class Configuration
    attr_accessor :postman_api_key,
                  :postman_collection_name,
                  :base_url

    def initialize
      @postman_api_key = ''
      @postman_collection_name = ''
      @base_url = ''
    end
  end

  def self.generate_docs
    file = File.read('doc/apipie_examples.json')
    @docs = JSON.parse(file)
    folder_hashes = []

    @docs = @docs.each_with_object({}) do |array, result|
      key = array[0].to_s.split('#')[0]
      (result[key] ||= []).concat(array[1])
    end.transform_values(&:flatten)

    @docs.each_key do |key|
      key_endpoint_hashes = []
      @docs[key].each do |endpoint|
        key_endpoint_hashes << create_endpoint_hash(endpoint, endpoint['request_data'] || {})
      end
      folder_hashes << create_folder(key, key_endpoint_hashes)
    end

    body = {
      collection: {
        info: {
          name: self.configuration.postman_collection_name,
          description: 'Test description',
          schema: 'https://schema.getpostman.com/json/collection/v2.1.0/collection.json'
        },
        item: folder_hashes
      }
    }.to_json

    headers = {
      'X-Api-Key': self.configuration.postman_api_key,
      'Content-Type': 'application/json'
    }

    collection_uid = check_collection_uid_by_name(headers)

    if collection_uid.nil?
      Faraday.public_send(:post, 'https://api.getpostman.com/collections/', body, headers)
    else
      Faraday.public_send(:put, "https://api.getpostman.com/collections/#{collection_uid['uid']}", body, headers)
    end
  end

  def self.check_collection_uid_by_name(headers)
    response = Faraday.public_send(:get, 'https://api.getpostman.com/collections/', {}, headers)
    JSON.parse(response.body)['collections'].select do |col|
      col['name'] == self.configuration.postman_collection_name
    end.last
  end

  def self.create_endpoint_hash(endpoint, req_body)
    {
      name: "#{endpoint['verb']} #{endpoint['path']}",
      request: {
        url: "#{self.configuration.base_url}#{endpoint['path']}",
        method: endpoint['verb'],
        header: [],
        body: {
          mode: 'raw',
          raw: req_body.to_json
        },
        description: endpoint['title']
      },
      response: []
    }
  end

  def self.create_folder(key, item_hashes)
    {
      name: key,
      description: key,
      item: item_hashes
    }
  end
end
