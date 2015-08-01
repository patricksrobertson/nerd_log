require 'ostruct'

module NerdLog
  class Encounter
    attr_reader :http_connection
    def initialize(options = {})
      @http_connection = options.fetch(:http_connection, NerdLog.configuration.http_connection)
    end

    def encounters
      encounters = []

      fetch.body.each do |zone|
        zone['encounters'].each do |encounter|
          encounters << OpenStruct.new(zone_id: zone['id'],
                                       id: encounter['id'],
                                       name: encounter['name'])
        end
      end
      encounters
    end

    def fetch
      response = http_connection.get("zones")

      response
    end
  end
end
