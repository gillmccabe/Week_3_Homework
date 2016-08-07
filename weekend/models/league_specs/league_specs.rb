require 'minitest/autorun'
require 'minitest/rg'
require_relative('../league')

class TestLeague < Minitest::Test
  
  def setup
    league1 = League.new()
  end



  def test_teams_in_league
    assert_equal(5, league1.teams_in_league());
  end

end