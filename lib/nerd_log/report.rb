module NerdLog
  class Report
    attr_reader :realm, :guild_name, :region, :http_connection
    def initialize(options)
      @realm           = options.fetch(:realm)
      @guild_name      = options.fetch(:guild_name)
      @region          = options.fetch(:region, 'US')
      @http_connection = options.fetch(:http_connection, NerdLog.configuration.http_connection)
    end

    def reports
      reports = []
      fetch.body.each do |report|
        reports << OpenStruct.new(id: report['id'], title: report['title'],
                                  zone: report['zone'], start_time: report['start'])
      end
      reports
    end

    def fetch
      response = http_connection.get("reports/guild/#{guild_name}/#{realm}/#{region}")

      response
    end
  end
end
