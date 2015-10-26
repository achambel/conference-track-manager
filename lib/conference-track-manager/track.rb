module ConferenceTrackManager
  module Model
    class Track
      attr_reader :total_duration, :lunch, :afternoon_begin
      attr_accessor :talks

      MORNING_SESSION_BEGIN = 9
      MORNING_SESSION_END = 12
      AFTERNOON_SESSION_BEGIN = 13
      NETWORKING_EVENT_BEGIN =  16
      AFTERNOON_SESSION_END = 17

      def initialize
        @total_duration = ((AFTERNOON_SESSION_END - AFTERNOON_SESSION_BEGIN) +
                          (MORNING_SESSION_END - MORNING_SESSION_BEGIN)) * 60
        @talks = []
      end

      def session_time(hour)
        Time.new(Time.now.year, Time.now.month, Time.now.day, hour)
      end

      def lunch
        session_time(MORNING_SESSION_END)
      end

      def afternoon_begin
        session_time(AFTERNOON_SESSION_BEGIN)
      end

      def schedule(talks)
        next_session = session_time(MORNING_SESSION_BEGIN)

        talks.each do |talk|
          talk.schedule = next_session
          next_session = next_session + (talk.duration * 60)

          if next_session.between?(session_time(MORNING_SESSION_END), session_time(AFTERNOON_SESSION_BEGIN))
             next_session = session_time(AFTERNOON_SESSION_BEGIN)
             talk.schedule = next_session
             next_session = next_session + (talk.duration * 60)
          end

        end
      end

    end
  end
end
