require 'minitest/autorun'
require_relative '../lib/conference-track-manager/input_talk_reader'
require_relative '../lib/conference-track-manager/talk'

class InputTalkReaderTest < Minitest::Test

  def test_read_from_input_file
    talk1 = ConferenceTrackManager::Model::Talk.new('Talk about ruby A', 26)
    talk2 = ConferenceTrackManager::Model::Talk.new('Talk about ruby B', 15)
    talk3 = ConferenceTrackManager::Model::Talk.new('Talk about ruby C', 5)
    @talks_spec = [talk1, talk2, talk3]

    @talks_retrieve = ConferenceTrackManager::Input::InputTalkReader.new.read('../input.txt')
    @talks_retrieve = @talks_retrieve[0..2] if @talks_retrieve
    assert_equal(@talks_spec, @talks_retrieve)

  end

end
