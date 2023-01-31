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
  students.each_with_index do |student, idx|
    puts "#{idx + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_array_with_while_loop(students)
  count = 0
  idx = 1
  while count < students.length
    puts "#{idx}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
    idx += 1
    count += 1
  end
end

# print students with a specific first letter
def print_array_specify_letter(students, letter)
  students.each_with_index do |student, idx|
    if letter == student[:name][0]
      puts "#{idx + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_array_less_than_twelve(students)
  students.each_with_index do |student, idx|
    if student[:name].length < 12
      puts "#{idx + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_array_with_while_loop(students)
print_footer(students)