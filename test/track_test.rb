require 'minitest/autorun'
require_relative '../lib/conference-track-manager/track'
require_relative '../lib/conference-track-manager/talk'
require_relative 'test_helper'

class TrackTest < Minitest::Test
  include ConferenceTrackManager

  def test_total_duration_should_420
    track = Model::Track.new
    assert_equal(420, track.total_duration)
  end

  def test_first_talk_should_begin_at_nine
    track = Model::Track.new
    talks = TestHelper.talk_generator(5)
    track.schedule(talks)

    assert_equal(9, talks.first.schedule.hour)
  end

  def test_talk_should_begin_when_preview_talk_ended
    track = Model::Track.new
    talks = TestHelper.talk_generator(2)
    track.schedule(talks)

    talk1 = talks.first
    assert_equal(talk1.schedule + (talk1.duration * 60), talks[1].schedule)

  end

  def test_talk_schedule_do_not_begin_between_12_and_13
    talk1 = Model::Talk.new('Talk about ruby 120min')
    talk2 = Model::Talk.new('Talk about ruby 100min')
    talks = [talk1, talk2]

    track = Model::Track.new
    track.schedule(talks)

    assert_equal(13, talks.last.schedule.hour)
  end

  def test_track_talks_do_not_should_nil
    track = Model::Track.new
    track.talks = nil

    assert(track.talks)
  end

end
