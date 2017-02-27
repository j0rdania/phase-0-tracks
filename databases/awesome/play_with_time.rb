# play with time, stored as integer - # of seconds since 1/1/1970



require 'sqlite3'
# faker is a gem that will assist in testing; it makes up fake test data
require 'faker'

# open ferry.db database
# create ferry database
ferry_db = SQLite3::Database.open("ferry.db")

cmd_to_run = "create table if not exists test_time(uid integer primary key,departure_time TEXT,comments varchar(255))"
ferry_db.execute(cmd_to_run)

#insert some records
# time_to_insert = datetime('2009-12-21 07:55:00.000')
cmd_to_run = "insert into test_time values (null,'2009-12-21 07:55:00.000','7:55am')"
puts "cmd to run is: #{cmd_to_run}"
# convert scheduled ferry time to  format
ferry_db.execute(cmd_to_run)

# select time from test_time
ferry_db.results_as_hash = true
cmd_to_run="select departure_time from test_time where uid=1"
puts "here are results from select departure_time from test_time where uid=1:"
p ferry_db.execute(cmd_to_run)
