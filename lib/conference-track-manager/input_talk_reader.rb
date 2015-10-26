require_relative 'talk'

module ConferenceTrackManager
  module Input
    class InputTalkReader
      def read(path)
        talks = []
        File.open(path) do |arquivo|
          arquivo.each do |line|
            talks << Model::Talk.new(line)
          end
        end
        talks
      end
    end
  end
end

