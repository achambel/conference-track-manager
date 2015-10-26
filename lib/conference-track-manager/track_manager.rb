require_relative 'track'

module ConferenceTrackManager
  module Process
    class TrackManager
      attr_reader :tracks

      def initialize(talks)
        @track = Model::Track.new
        @track.talks = talks
        @tracks = []
      end

      def proccess
        while @track.talks.size > 0
          @tracks << fill_session(@track.total_duration) # morning(180)+afternoon(240)
        end
      end

      def list
        @tracks.each_with_index do |talks, i|
          @track.schedule(talks)
          puts "Track #{i+1}:"
          talks.each do |talk|
            puts "#{@track.lunch.strftime('%I:%M %p')} Lunch" if talk.schedule == @track.afternoon_begin
            puts "#{talk.schedule.strftime('%I:%M %p')} #{talk.title} #{talk.duration}min"
          end
          networking = talks.last.schedule + (talks.last.duration * 60)
          puts "#{networking.strftime('%I:%M %p')} Networking"

          puts

        end
      end

    private
      def fill_session(session_minutes)
        talks_by_session = []
        total_session = 0

        @track.talks.clone.each do |talk|
          if (total_session + talk.duration) <= session_minutes
           total_session += talk.duration
           talks_by_session << talk
           @track.talks.delete(talk)
          end
        end
        talks_by_session
      end

    end
  end
end
