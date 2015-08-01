require "nerd_log/version"
require "nerd_log/report"
require "nerd_log/encounter"
require "faraday_middleware"

module NerdLog
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration = Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :api_key

    def http_connection
      @connection ||= Faraday.new(url: 'https://www.warcraftlogs.com/v1/',
                                  params: {api_key: self.api_key}) do |faraday|
        faraday.request :url_encoded
        faraday.request :json

        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
