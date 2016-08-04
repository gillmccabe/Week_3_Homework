require('pg')
require_relative('../db/sql_runner')

class Pets


attr_reader(:id, :name, :address, :stock_type)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['address']
    @petstore_id = options['petstore_id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM pets;"
    pets = SqlRunner.run(sql)
    result = pets.map { |pets| Pets.new(pets)}
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = #{id}"
    pets = SqlRunner.run(sql).first
    return Pets.new(pets)
  end


  def self.delete(id)
    sql = "DELETE * FROM pets WHERE id = #{id}"
    pets = SqlRunner.run(sql)
  end


  def save()
    sql = "INSERT INTO pets (name, type, petstore_id) VALUES ('#{@name}, #{type}, #{petstore_id}') RETURNING *;"
    pets = SqlRunner.run(sql).first
    @id = pets['id'].to_i
  end


  def petstore()
    sql = "SELECT * FROM petstore WHERE id = #{@petstore_id};"
    pet_petstore = SqlRunner.run(sql).first
    PetStore.new(pet_petstore)
  end



end