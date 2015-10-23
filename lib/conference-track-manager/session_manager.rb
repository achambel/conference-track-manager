module ConferenceTrackManager

  module Process

    class SessionManager

      def fill_session(session, talks)
        talks_session = []
        total_talks_duration = 0
        talks.each do |talk|
          total_talks_duration += talk.duration
          talks_session << talk if total_talks_duration <= session

        end

        talks_session
      end

    end

  end

end
