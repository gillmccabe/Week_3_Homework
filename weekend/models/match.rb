require('pg')
require_relative('../db/sql_runner')

class Match 

  attr_reader(:id, :home_team_id, :away_team_id, :home_team_score, :away_team_score)

  def initialize(options)
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
  end


  def save()
    sql = "INSERT INTO matches ( home_team_id, away_team_id, home_team_score, away_team_score ) VALUES ( #{@home_team_id}, #{@away_team_id}, #{@home_team_score}, #{@away_team_score} ) RETURNING *;"
    match = SqlRunner.run(sql).first
    @id = match['id'].to_i           
  end


  def delete()
    sql = "DELETE * FROM matches WHERE id = #{id};"
    SqlRunner.run(sql).first
    return nil
  end


  def update()
    sql = "UPDATE matches SET (home_team_id = '#{@home_team_id}',
    away_team_id = #{@away_team_id},
    home_team_score = #{@home_team_score},
    away_team_score = #{@away_team_score}
    WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return result
  end


  def teams()
    sql = "SELECT * FROM teams WHERE id = #{@home_team_id} OR id = #{@away_team_id};"
    team_matches = SqlRunner.run(sql)
    result = team_matches.map { |team| Team.new (team) }
    return result
  end


  def self.all()
    sql = "SELECT * FROM matches;"
    matches = SqlRunner.run(sql)
    result = matches.map { |match| Match.new(match) }
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM matches WHERE id = #{id}"
    match = SqlRunner.run(sql).first
    return Match.new(match)
  end


  def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
    return nil
  end
      


end