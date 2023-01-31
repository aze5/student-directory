# put all students in an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
# print the students
def print_header
    puts "The students of Villain Academy"
    puts "-----------------"
end

def print_array(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please the name of the students"
  puts "To finish, please press enter twice."
  # array to store student names
  students = []
  # user input
  name = gets.chomp
  while !name.empty? do
    # add student has to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from user
    name = gets.chomp
  end
  # return students array
  return students
end

students = input_students
print_header
print_array(students)
print_footer(students)