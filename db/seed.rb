require_relative('../models/student')
require_relative('../models/house')
require_relative('sql_runner')


house1 = House.new({'house_name' => 'Fire'})
house2 = House.new({'house_name' => 'Water'})
house3 = House.new({'house_name' => 'Air'})
house4 = House.new({'house_name' => 'Earth'})

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({'first_name' => 'Zelda', 'last_name' => 'Smith', 'age' => 12,'house_id'=>house1.id})
student2 = Student.new({'first_name' => 'Racheal', 'last_name' => 'Ellen', 'age' => 12,'house_id'=>house2.id})

student1.save()
student2.save()








#
