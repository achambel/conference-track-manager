require 'minitest/autorun'
require_relative '../lib/conference-track-manager/talk'

class TalkTest < Minitest::Test
  include ConferenceTrackManager

  def test_when_lightning_return_5
    talk = Model::Talk.new('  Talk about Ruby      lightning    ')
    assert_equal(5, talk.duration)
  end

  def test_should_duration_equal_60
    talk = Model::Talk.new('Talk about Ruby 60min')
    assert_equal(60, talk.duration)
  end

  def test_strip_title
    talk = Model::Talk.new('    Talk about Ruby         30')
    assert_equal('Talk about Ruby', talk.title)
  end

  def test_when_without_title_insert_number
    talk = Model::Talk.new("60min")
    assert talk.title.is_a? Bignum
  end
end
