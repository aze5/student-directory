# put all students in an array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]
# print the students
def print_header
    puts "The students of Villain Academy"
    puts "-----------------"
end

def print_array(names)
  names.each do |name|
    puts name
  end
end

# print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print_array(students)
print_footer(students)