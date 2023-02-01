# get user input for student names & cohort
def input_students
  months = ["january", "february", "march", "april", "may", "june", "july", 
  "august", "september", "october", "november", "december"]
  puts "Please enter the name of the student"
  # replace .chomp for excercise 10
  name = gets
  name.delete!("\n")
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
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
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

# add additional info to to a given student's array
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
    puts "-----------------"
end

# prints students grouped by cohort
def print_students_by_cohort(students)
  students_by_cohort = {}
  students.each { |student_info|
  # add cohort if it hasnt already been added
    if !students_by_cohort.include? student_info[:cohort]
      students_by_cohort[student_info[:cohort]] = [] 
    end
    # append student name to value
    students_by_cohort[student_info[:cohort]] << student_info[:name]
    }
  # print the students grouped by cohort
  students_by_cohort.each { |cohort, value|
    puts "Students in #{cohort.capitalize} cohort: #{value}"
  }
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
if students.empty?
  print "There are no students at Villain Academy"
else
  print_header
  print_array(students)
  print_footer(students)
end
