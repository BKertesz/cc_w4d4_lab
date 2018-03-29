require_relative('../db/sql_runner')

class House
  attr_reader :house_name, :id

  def initialize(options)
    @house_name = options['house_name']
    @id = options['id'].to_i
  end

  def save()
   sql = "INSERT INTO houses(house_name)
    VALUES($1)
    RETURNING *"
   values = [@house_name]
   house_data = SqlRunner.run(sql, values)
   @id = house_data.first()['id'].to_i
 end

def self.all()
  sql = "SELECT * FROM houses"
  houses = SqlRunner.run(sql)
  result = houses.map{ |house| House.new(house)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM houses WHERE id=$1"
  values = [@id]
  houses = SqlRunner.run(sql,values)
  result = houses.map{ |house| House.new(house)}
  return result
end

end
