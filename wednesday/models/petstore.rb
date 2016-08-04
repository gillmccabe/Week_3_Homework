require('pg')
require_relative('../db/sql_runner')

class PetStore


attr_reader(:id, :name, :address, :stock_type)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end


  def self.all()
    sql = "SELECT * FROM petstore;"
    petstores = SqlRunner.run(sql)
    result = petstores.map { |petstore| PetStore.new(petstore)}
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM petstores WHERE id = #{id}"
    petstore = SqlRunner.run(sql).first
    return PetStore.new(petstore)
  end


  def self.delete(id)
    sql = "DELETE * FROM petstore WHERE id = #{id}"
    petstore = SqlRunner.run(sql)
  end


  def save()
    sql = "INSERT INTO petstore (name, address, stock_type) VALUES ('#{@name}, #{address}, #{stock_type}') RETURNING *;"
    petstore = SqlRunner.run(sql).first
    @id = petstore['id'].to_i
  end



end