@students = []

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
  while !name.empty? && !cohort.empty? do
    # add student has to array
    @students << {name: name, cohort: cohort.to_sym}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from user
    puts "Please enter the name of the next student"
    puts "If you are finished, press enter twice."
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
  
  return @students
end

# add additional info to to a given student's array
def add_additional_info
  puts "Whos info would you like to update?"
  puts "Please enter their full name:"
  name = gets.chomp
  @students.each do |student_info|
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
def print_students_by_cohort
  students_by_cohort = {}
  @students.each { |student_info|
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
def print_array
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# print the total number of students
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  # options for user
  puts "1. Input student info"
  puts "2. Show the students"
  puts "3. Save student data to students.csv"
  puts "4. Load student data from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_array
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_data
    when "4"
      load_data
    when "9"
      exit
    else
      "I don't know what you meant. Please try again"
  end
end

def save_data
  # open csv for writing
  file = File.open("./.gitignore/students.csv", "w")
  # iterate over students array
  @students.each { |student_info|
    student_data = [student_info[:name], student_info[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  # close file
  file.close
end

def load_data
  file = File.open("./.gitignore/students.csv", "r")
  file.readlines.each { |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  }
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
