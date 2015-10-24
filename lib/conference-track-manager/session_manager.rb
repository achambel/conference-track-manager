module ConferenceTrackManager

  module Process

    class SessionManager

      def fill_session(session, talks)
        talks_session = []
        total_talks_duration = 0
        talks.each do |talk|
          total_talks_duration += talk.duration
          if total_talks_duration <= session
            talks_session << talk
          else
            total_talks_duration -= talk.duration
          end

        end

        talks_session
      end

    end

  end

end
