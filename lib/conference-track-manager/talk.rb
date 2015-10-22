module ConferenceTrackManager
  module Model
    class Talk
      attr_reader :title, :duration, :schedule

      def initialize(title, duration)
        @title = title
        @duration = duration
      end

      def hash
        @title.hash ^ @duration.hash
      end

      def eql?(other)
        @title == other.title &&
        @duration == other.duration
      end

      def ==(other)
        @title == other.title &&
        @duration == other.duration
      end
    end
  end
end
