# this program will create and populate a database for use with the ferry application

# sqlite3 will be the database that holds user and ferry data
require 'sqlite3'
# faker is a gem that will assist in testing; it makes up fake test data
require 'faker'
# ferry_schedule.rb contains ferry schedule information
require_relative 'ferry_schedule.rb'

# create ferry database
ferry_db = SQLite3::Database.new("ferry.db")

# create users table
cmd_to_run = "CREATE TABLE IF NOT EXISTS users(
  uid integer primary key,
  user_name varchar(255),
  password varchar(255),
  first_name varchar(255),
  travel_time_house_to_terminal integer,
  travel_time_work_to_terminal integer,
  sprinting_okay boolean
)"
ferry_db.execute(cmd_to_run)

# create ferry_schedule table
cmd_to_run = "CREATE TABLE IF NOT EXISTS ferry_schedule(
  uid integer primary key,
  originating_city varchar(255),
  day_of_week varchar(255),
  departure_time_hour integer,
  departure_time_min integer
  )"
ferry_db.execute(cmd_to_run)

# create satisfaction_log table
cmd_to_run = "CREATE TABLE IF NOT EXISTS satisfaction_log(
  uid integer primary key,
  user_id integer,
  satisfied boolean,
  comments varchar(2000),
  foreign key(user_id) REFERENCES users(uid)
)"
ferry_db.execute(cmd_to_run)

# populate users table with one user
cmd_to_run = "insert into users values (null,'Jorkin','xyz','Jordan',22,13,'true')"
ferry_db.execute(cmd_to_run)

# populate ferry schedule table, using ferry_schedule.rb as the input
FERRY_SCHEDULE.each do |schedule_entry|
  cmd_to_run = "insert into ferry_schedule values (null,'#{schedule_entry[0]}','#{schedule_entry[1]}',#{schedule_entry[2]},#{schedule_entry[3]})"
  ferry_db.execute(cmd_to_run)  
end



