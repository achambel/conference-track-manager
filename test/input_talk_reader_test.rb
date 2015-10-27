require 'minitest/autorun'
require_relative '../lib/conference-track-manager/input_talk_reader'
require_relative '../lib/conference-track-manager/talk'

class InputTalkReaderTest < Minitest::Test
  include ConferenceTrackManager

  def test_read_from_input_file
    talk1 = Model::Talk.new('Writing Fast Tests Against Enterprise Rails 60min')
    talk2 = Model::Talk.new('Overdoing it in Python 45min')
    talk3 = Model::Talk.new('Lua for the Masses 30min')
    talk4 = Model::Talk.new('Ruby Errors from Mismatched Gem Versions 45min')
    talk5 = Model::Talk.new('Common Ruby Errors 45min')
    talk6 = Model::Talk.new('Rails for Python Developers 5min')
    @talks_spec = [talk1, talk2, talk3, talk4, talk5, talk6]

    @talks_retrieve = Input::InputTalkReader.new.read('../input.txt')
    @talks_retrieve = @talks_retrieve[0..5] if @talks_retrieve
    assert_equal(@talks_spec, @talks_retrieve)

  end

end
