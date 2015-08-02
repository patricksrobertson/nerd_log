require 'ostruct'

module NerdLog
  class Fight
    attr_reader :report_id, :http_connection
    def initialize(options = {})
      @report_id       = options.fetch(:report_id)
      @http_connection = options.fetch(:http_connection, NerdLog.configuration.http_connection)
    end

    def fights
      unless @fights
        body = fetch.body
        raw_fights = body['fights'].select {|f| f['boss'] != 0}
        friendlies = body['friendlies'].select {|f| f['type'] != 'NPC'}
        @fights = {}

        raw_fights.each do |raw_fight|
          @fights[raw_fight['id']] = OpenStruct.new(id: raw_fight['boss'],
                                   kill: raw_fight['kill'],
                                   difficulty: raw_fight['difficulty'], players: [])
        end

        friendlies.each do |player|
          player['fights'].each do |fight|
            boss_fight = @fights[fight['id']]
            boss_fight.players.push(player['name']) if boss_fight
          end
        end
      end
      @fights.values
    end

    def fetch
      response = http_connection.get("report/fights/#{report_id}")

      response
    end
  end
end
