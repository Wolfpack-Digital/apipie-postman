# frozen_string_literal: true

require 'spec_helper'
require 'faraday'
require 'apipie-postman'

RSpec.describe ApipiePostman, type: :model do
  context 'with configuration setup' do
    it 'sets ApipiePostman configuration' do
      ApipiePostman.configure do |config|
        config.postman_api_key = 'test_postman_api_key'
        config.postman_collection_name = 'Test collection name'
        config.base_url = 'test_base_url'
      end

      expect(ApipiePostman.configuration.base_url).to eq('test_base_url')
      expect(ApipiePostman.configuration.postman_collection_name).to eq('Test collection name')
      expect(ApipiePostman.configuration.postman_api_key).to eq('test_postman_api_key')
    end
  end
end
