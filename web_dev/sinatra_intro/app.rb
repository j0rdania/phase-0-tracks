# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET route that displays an address 
get '/contact' do
   resp = "123 Elm St.<br>"
   resp += "Sunnyvale, CA 98110"
   resp
end

# write a GET route that takes a person's name as query parameter and compliments that person
get '/great_job' do
  if !params[:name]
    "Good job!"
  else
    "Good job, #{params[:name]}!"
  end
end


# write a GET route that uses route parameters to add two numbers and respond with the result
get '/add_two_numbers/:number1/:number2' do
  ((params[:number1].to_i) + (params[:number2].to_i)).to_s
end

# write a GET route to display full name, id, age, and campus for a given first name
# first name is defined as all characters before the first space in the name passed in
# this GET route will find all students whose name starts with the passed in first name
# (so if Mil Smith is passed in, Mil would be the first name, and entries such as
# Mil Jones, Mil Green, and Mildred Train would all be included in the result)
# more than one row many be returned by this GET route
# one param: name
# GET /
get '/students/with/first/name' do
  first_name = params[:name].split(' ')[0]
  first_name_wildcard= first_name + "%"
  students_with_this_first_name = db.execute("select name, id, age, campus from students where name like '#{first_name_wildcard}';")
  if students_with_this_first_name.length == 0
    response = "Sorry, Charlie. There are no students with the first name #{first_name}."
  else
    response = "Students with a first name of #{first_name}:<br><br>"
    students_with_this_first_name.each do |student|
      response += "  Full Name: #{student['name'].to_s}<br>"
      response += "  ID: #{student['id'].to_s}<br>"
      response += "  Age: #{student['age'].to_s}<br>"   
      response += "  Campus: #{student['campus']}<br><br>"
    end
    response += "<br>"
  end
  response
end 












 