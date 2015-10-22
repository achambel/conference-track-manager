require_relative 'talk'

module ConferenceTrackManager
  module Input
    class InputTalkReader
      def read(path)
        @talks = []

        File.readlines(path).each do |line|
          line_splited = line.split
          duration = line_splited.last == "lightning" ? 5 : line.split.last.to_i
          line_splited.pop
          title = line_splited.join(" ")
          @talks << Model::Talk.new(title, duration)
        end

        @talks
      end
    end
  end
end