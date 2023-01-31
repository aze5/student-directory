# get user input for student names
def input_students
  months = ["january", "february", "march", "april", "may", "june", "july", 
  "august", "september", "october", "november", "december"]
  puts "Please the name of the student"
  name = gets.chomp
  puts "Please enter the cohort of the student"
  cohort = gets.chomp
  if cohort.empty?
    cohort = "Unspecified"
  else
    while !months.include? cohort.downcase do
      puts "ERROR: cohort not valid"
      puts "Please enter the cohort of the student (eg: 'December')"
      cohort = gets.chomp
    end
  end
  # array to store student names
  students = []
  while !name.empty? && !cohort.empty? do
    # add student has to array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from user
    puts "Please enter the name of the next student"
    name = gets.chomp
    puts "Please enter the cohort of the student"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "Unspecified"
    else
      while !months.include? cohort.downcase do
        puts "ERROR: cohort not valid"
        puts "Please enter the cohort of the student (eg: 'December')"
        cohort = gets.chomp
      end
    end
  end
  # return students array

  return students
end

# method to add additional info to a student's hash
def add_additional_info(students)
  puts "Whos info would you like to update?"
  puts "Please enter their full name:"
  name = gets.chomp
  students.each do |student_info|
    if student_info[:name] == name
      puts "What category would you like to add to this student's info:"
      key = gets.chomp
        puts "Please enter the info you would like to add to '#{key}'"
        value = gets.chomp
        student_info[key] = value
    end
  end
end

# print the header
def print_header
    puts "The students of Villain Academy"
    puts "-----------------".center(30)
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
add_additional_info(students)