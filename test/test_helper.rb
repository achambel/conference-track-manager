require_relative '../lib/conference-track-manager/talk'

module ConferenceTrackManager
  module TestHelper
    def self.talk_generator(qty)
      talks = []
      qty.times do |i|
        title = "Talk about Ruby #{i} #{rand(40..60)}min"
        talks << Model::Talk.new(title)
      end
      talks
    end
  end
end
