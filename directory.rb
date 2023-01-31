# get user input for student names
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

# print the header
def print_header
    puts "The students of Villain Academy"
    puts "-----------------"
end

# print student names
def print_array(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_array(students)
print_footer(students)