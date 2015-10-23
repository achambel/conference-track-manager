require 'minitest/autorun'
require_relative '../lib/conference-track-manager/input_talk_reader'
require_relative '../lib/conference-track-manager/talk'

class InputTalkReaderTest < Minitest::Test

  def test_read_from_input_file
    talk1 = ConferenceTrackManager::Model::Talk.new('Writing Fast Tests Against Enterprise Rails', 60)
    talk2 = ConferenceTrackManager::Model::Talk.new('Overdoing it in Python', 45)
    talk3 = ConferenceTrackManager::Model::Talk.new('Lua for the Masses', 30)
    talk4 = ConferenceTrackManager::Model::Talk.new('Ruby Errors from Mismatched Gem Versions', 45)
    talk5 = ConferenceTrackManager::Model::Talk.new('Common Ruby Errors', 45)
    talk6 = ConferenceTrackManager::Model::Talk.new('Rails for Python Developers', 5)
    @talks_spec = [talk1, talk2, talk3, talk4, talk5, talk6]

    @talks_retrieve = ConferenceTrackManager::Input::InputTalkReader.new.read('../input.txt')
    @talks_retrieve = @talks_retrieve[0..5] if @talks_retrieve
    assert_equal(@talks_spec, @talks_retrieve)

  end

end
