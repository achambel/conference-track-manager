require 'minitest/autorun'
require_relative 'test_helper'
require_relative '../lib/conference-track-manager/input_talk_reader'
require_relative '../lib/conference-track-manager/talk'
require_relative '../lib/conference-track-manager/track'
require_relative '../lib/conference-track-manager/track_manager'


class SessionManagerTest < Minitest::Test
  include ConferenceTrackManager

  def test_fill_a_session_with_complete_time
      talks = Input::InputTalkReader.new.read('../input.txt')
      #talks = TestHelper.talk_generator(20)

      track_manager = Process::TrackManager.new(talks)
      track_manager.proccess
      track_manager.list

      puts "Talks restantes"
      puts talks

      #assert_equal(session, session_talks.map(&:duration).inject(:+))
      #assert_equal(5, session_talks.size)
  end

end
