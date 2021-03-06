require_relative('../db/sql_runner')

class Student
  attr_reader :first_name, :last_name, :age, :id, :house_id

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @id = options['id'].to_i
    @house_id = options['house_id'].to_i

  end

  def save()
   sql = "INSERT INTO students(first_name, last_name, age, house_id)
    VALUES($1, $2, $3, $4)
    RETURNING *"
   values = [@first_name, @last_name, @age, @house_id]
   student_data = SqlRunner.run(sql, values)
   @id = student_data.first()['id'].to_i
 end

 def my_name()
   return "#{first_name} #{last_name}"
 end

def self.all()
  sql = "SELECT * FROM students"
  students =SqlRunner.run(sql)
  result = students.map{ |student| Student.new(student)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM students WHERE id=$1"
  values = [id]
  students = SqlRunner.run(sql,values)
  result = students.map{ |student| Student.new(student)}
  return result.first
end

def house
  sql = "SELECT houses.* FROM houses WHERE id=$1"
  values = [@house_id]
  puts sql
  puts @house_id
  house = SqlRunner.run(sql,values)
  result = house.map{ |house| House.new(house)}
  return result.first
end

end
