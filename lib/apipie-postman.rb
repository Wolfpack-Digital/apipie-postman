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
    docs_hashes = []
    endpoints_hashes = []

    @docs.each_key do |key|
      docs_hashes << @docs[key]
    end

    docs_hashes.each do |doc_hash|
      doc_hash.each do |endpoint|
        req_body = if endpoint['request_data'].nil?
                     {}
                   else
                     endpoint['request_data']
                   end

        endpoints_hashes << {
          name: endpoint['title'],
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
    end

    body = {
      collection: {
        info: {
          name: self.configuration.postman_collection_name,
          description: 'Test description',
          schema: 'https://schema.getpostman.com/json/collection/v2.1.0/collection.json'
        },
        item: endpoints_hashes
      }
    }.to_json
    headers = {
      'X-Api-Key': self.configuration.postman_api_key,
      'Content-Type': 'application/json'
    }

    Faraday.public_send(:post, 'https://api.getpostman.com/collections/', body, headers)

    # if Object.const_defined?('POSTMAN_COLLECTION_UID') && Object.const_defined?('POSTMAN_COLLECTION_ID')
    #   Faraday.public_send(:put, "https://api.getpostman.com/collections/#{Object.const_get('POSTMAN_COLLECTION_UID')}", body, headers)
    # else
    #   response = Faraday.public_send(:post, 'https://api.getpostman.com/collections/', body, headers)

    #   if response.status == 200
    #     Object.const_set('POSTMAN_COLLECTION_UID', JSON.parse(response.body)['collection']['uid'])
    #     Object.const_set('POSTMAN_COLLECTION_ID', JSON.parse(response.body)['collection']['id'])
    #   end
    # end
  end
end
