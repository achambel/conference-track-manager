require 'securerandom'

module ConferenceTrackManager
  module Model
    class Talk
      attr_reader :title, :duration
      attr_accessor :schedule

      def initialize(line)
        line_splited = line.split
        duration = line_splited.last.strip == "lightning" ? 5 : line.split.last.to_i
        line_splited.pop
        title = line_splited.join(" ").strip
        title = SecureRandom.uuid.gsub("-", "").hex if title.length == 0
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

      def to_s
        "<Talk @schedule=#{@schedule}, @title=#{@title}, @duration=#{@duration}>"
      end
    end
  end
end
