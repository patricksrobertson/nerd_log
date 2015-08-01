require 'ostruct'

module NerdLog
  class Fight
    attr_reader :report_id, :http_connection
    def initialize(options = {})
      @report_id       = options.fetch(:report_id)
      @http_connection = options.fetch(:http_connection, NerdLog.configuration.http_connection)
    end

    def kills
      @kills ||= fights.select {|f| f.kill == true }
    end

    def attempts
      @attempts ||= fights.select {|f| f.kill == false }
    end

    def fights
      unless @fights
        raw_fights = fetch.body['fights'].select {|f| f['boss'] != 0}
        @fights = []

        raw_fights.each do |raw_fight|
          @fights << OpenStruct.new(id: raw_fight['boss'],
                                   kill: raw_fight['kill'],
                                   difficulty: raw_fight['difficulty'])
        end
      end
      @fights
    end

    def fetch
      response = http_connection.get("report/fights/#{report_id}")

      response
    end
  end
end
