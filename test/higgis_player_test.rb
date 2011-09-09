require "test/unit"
require "./players/higgis_player.rb"

class HiggisPlayerTest < Test::Unit::TestCase

  def test_player_name_should_be_higgis
    assert_equal "higgis", HiggisPlayer.new.name
  end
end