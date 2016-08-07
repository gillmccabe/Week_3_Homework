require('pg')
require_relative('../db/sql_runner')

class Team 

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO teams ( name ) VALUES ('#{@name}') RETURNING *;"
    team = SqlRunner.run(sql).first
    @id = team['id'].to_i           
  end


  def delete()
    sql = "DELETE * FROM teams WHERE id = #{id}"
    SqlRunner.run(sql).first
    return nil
  end


  def update()
      sql = "UPDATE teams SET name = #{@name} WHERE id = #{id};"
      result = SqlRunner.run(sql)
      return result 
  end


  def matches()
    sql = "SELECT * FROM matches WHERE home_team_id = #{@id} OR away_team_id = #{@id};"
    team_matches = SqlRunner.run(sql)
    result = []
    for match in team_matches
      result << match
    end
    return result
  end


  def self.all()
    sql = "SELECT * FROM teams;"
    teams = SqlRunner.run(sql)
    result = teams.map { |team| Team.new(team) }
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM teams WHERE id = #{id}"
    team = SqlRunner.run(sql).first
    return Team.new(team)
  end

  def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
    return nil
  end
      
end