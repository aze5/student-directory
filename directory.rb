@students = []

# get user input for student names & cohort
def input_students
  puts "Please enter the name of the student"
  name = STDIN.gets.chomp
  cohort = get_cohort
  while !name.empty? && !cohort.empty? do
    add_hash_to_array(name, cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from user
    puts "Please enter the name of the next student"
    puts "If you are finished, press enter twice."
    name = STDIN.gets.chomp
    cohort = get_cohort
  end
  # return students array
  return @students
end

def get_cohort
  months = ["january", "february", "march", "april", "may", "june", "july", 
  "august", "september", "october", "november", "december"]
  
  puts "Please enter the cohort of the student"
  cohort = STDIN.gets.chomp
  if cohort.empty?
      cohort = "Unspecified"
  else
    while !months.include? cohort.downcase do
      puts "ERROR: cohort not valid"
      puts "Please enter the cohort of the student (eg: 'December')"
      cohort = STDIN.gets.chomp
    end
  end
  return cohort
end

def add_hash_to_array(name, cohort)
  # add student hash to array
  @students << {name: name, cohort: cohort.to_sym}
end

# add additional info to to a given student's array
def add_additional_info
  puts "Whos info would you like to update?"
  puts "Please enter their full name:"
  name = STDIN.gets.chomp
  @students.each do |student_info|
    if student_info[:name] == name
      puts "What category would you like to add to this student's info:"
      key = STDIN.gets.chomp
        puts "Please enter the info you would like to add to '#{key}'"
        value = STDIN.gets.chomp
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
  puts "Overall, we have #{@students.count} great students\n"
end

def print_menu
  # options for user
  puts "\n1. Input student info"
  puts "2. Show the students"
  puts "3. Save student data to students.csv"
  puts "4. Load student data from students.csv"
  puts "5. Show the students in each cohort"
  puts "6. Add additional information to a given student"
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
    when "5"
      print_students_by_cohort
    when "6"
      add_additional_info
    when "9"
      exit
    else
      "I don't know what you meant. Please try again"
  end
end

def save_data
  puts "Please enter the filename that you would like to write the data to"
  file_to_write = gets.chomp
  # open csv for writing
  File.open(file_to_write, "w") { |file|
    # iterate over students array
  @students.each { |student_info|
    student_data = [student_info[:name], student_info[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line }
  }
  puts "Successfully saved data to file"
end

def load_data(filepath = "students.csv")
  File.open(filepath, "r") { |file|
    file.readlines.each { |line|
    name, cohort = line.chomp.split(",")
    add_hash_to_array(name, cohort)}
  }
  puts "Successfully loaded file"
end

def try_load_data
  filepath = ARGV.first # first argument from command line
  return if filepath.nil? # if filepath is not given, leave the function
  if File.exist?(filepath) 
    load_data(filepath)
    puts "loaded #{@students.count} from #{filepath}"
  else
    puts "Sorry, #{filepath} doesn't exist"
    exit # quit program
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


def print_source_code
  File.open($0, "r") { |file|
  file.readlines.each do |line|
    puts line
  end
  }
end

interactive_menu

