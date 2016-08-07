# require('pry-byebug')
require_relative('models/team')
require_relative('models/match')


team1 = Team.new( { 'name' => 'Average Joes' } )

team2 = Team.new( { 'name' => 'Purple Cobras' } )

team3 = Team.new( { 'name' => 'Skillz That Killz' } )

team4 = Team.new( { 'name' => 'Team Blitzkrieg' } )

team5 = Team.new( { 'name' => 'Clown Punchers' } )

team1.save()
team2.save()
team3.save()
team4.save()
team5.save()


match1 = Match.new( { 'home_team_id' => team1.id, 'away_team_id' => team2.id, 'home_team_score' => 1, 'away_team_score' => 2 } )


match2 = Match.new( { 'home_team_id' => team1.id, 'away_team_id' => team3.id, 'home_team_score' => 3, 'away_team_score' => 2 } )


match3 = Match.new( { 'home_team_id' => team1.id, 'away_team_id' => team4.id, 'home_team_score' => 2, 'away_team_score' => 2 } )


match4 = Match.new( { 'home_team_id' => team1.id, 'away_team_id' => team5.id, 'home_team_score' => 3, 'away_team_score' => 1 } )


match5 = Match.new( { 'home_team_id' => team1.id, 'away_team_id' => team5.id, 'home_team_score' => 5, 'away_team_score' => 1 } )


match6 = Match.new( { 'home_team_id' => team2.id, 'away_team_id' => team3.id, 'home_team_score' => 1, 'away_team_score' => 2 } )


match7 = Match.new( { 'home_team_id' => team2.id, 'away_team_id' => team4.id, 'home_team_score' => 1, 'away_team_score' => 2 } )


match8 = Match.new( { 'home_team_id' => team2.id, 'away_team_id' => team5.id, 'home_team_score' => 4, 'away_team_score' => 1 } )


match9 = Match.new( { 'home_team_id' => team3.id, 'away_team_id' => team4.id, 'home_team_score' => 2, 'away_team_score' => 2 } )


match10 = Match.new( { 'home_team_id' => team3.id, 'away_team_id' => team5.id, 'home_team_score' => 1, 'away_team_score' => 4 } )


match11 = Match.new( { 'home_team_id' => team4.id, 'away_team_id' => team5.id, 'home_team_score' => 1, 'away_team_score' => 4 } )

match1.save()
match2.save()
match3.save()
match4.save()
match5.save()
match6.save()
match7.save()
match8.save()
match9.save()
match10.save()
match11.save()



# binding.pry
# nil