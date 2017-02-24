# this program will create and populate a database for use with the ferry application

# sqlite3 will be the database that holds user and ferry data
require 'sqlite3'
# faker is a gem that will assist in testing; it makes up fake test data
require 'faker'

# create ferry database
ferry_db = SQLite3:: Database.new('ferry.db')

# create users table
cmd_to_run = "CREATE TABLE users(
  uid integer primary key,
  user_name varchar(255),
  password varchar(255),
  first_name varchar(255),
  travel_time_house_to_terminal integer,
  travel_time_work_to_terminal integer,
  sprinting_okay boolean
);"
ferry_db.execute(cmd_to_run)

# create ferry_schedule table
cmd_to_run = CREATE TABLE ferry_schedule (
  uid integer primary key,
  originating_city varchar(255), 
  day_of_week varchar(255),
  departure_time_hour integer,
  departure_time_min integer
  );"
ferry_db.execute(cmd_to_run)

# create satisfaction_log table
cmd_to_run = "CREATE TABLE satisfaction_log (
  uid integer primary key,
  user_id integer,
  satisfied boolean,
  comments varchar(2000),
  foreign key (user_id) REFERENCES users (uid);
);"
ferry_db.execute(cmd_to_run)

