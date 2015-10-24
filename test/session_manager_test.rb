require 'minitest/autorun'
require_relative '../lib/conference-track-manager/session_manager'
require_relative '../lib/conference-track-manager/talk'

class SessionManagerTest < Minitest::Test

  def test_fill_a_session_with_complete_time
      session = 180
      talk1 = ConferenceTrackManager::Model::Talk.new('Writing Fast Tests Against Enterprise Rails', 45)
      talk2 = ConferenceTrackManager::Model::Talk.new('Overdoing it in Python', 30)
      talk3 = ConferenceTrackManager::Model::Talk.new('Lua for the Masses', 60)
      talk4 = ConferenceTrackManager::Model::Talk.new('Ruby Errors from Mismatched Gem Versions', 200)
      talk5 = ConferenceTrackManager::Model::Talk.new('Common Ruby Errors', 5)
      talk6 = ConferenceTrackManager::Model::Talk.new('Rails for Python Developers', 40)

      talks = [talk1, talk2, talk3, talk4, talk5, talk6]

      session_manager = ConferenceTrackManager::Process::SessionManager.new

      session_talks = session_manager.fill_session(session, talks)

      total_duaration_session_talks = 0
      session_talks.each do |talk|
          total_duaration_session_talks += talk.duration
      end

      assert_equal(session, total_duaration_session_talks)
  end

end
