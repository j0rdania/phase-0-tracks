# This is a web application to determine when a Bainbridge Islander should leave from home or work in order to 
# catch the next Bainbridge Island/Seattle ferry. 

# An sqlite3 database is used to store user and ferry data.

# New users will need to create an account and fill in profile information; returning users will need 
# to log in before being able to use the application.

# Users will be able to update the following profile information:

  # user name (user name must be unique)
  # password (current password will need to be entered before the password may be updated)
  # first_name
  # email_address
  # travel time from house to Bainbridge Island terminal (includes parking time if driving)
  # travel time from work to Colman Dock
  # sprinting okay? ('true' is user doesn't mind sprinting to catch the ferry, 'false' otherwise)

# The log on screen will have a "forgot password?" option. If chosen, an e-mail 
# containing the user's user name and password will be sent to the e-mail address on file
# (note: e-mail is not secure, so this feature should be modified in the future.)

# 
# sqlite3 will be the database that holds user and ferry data. It will also hold a satisfaction log to 
# get user feedback about the site.
require 'sqlite3'
# faker is a gem that will assist in testing; it makes up fake test data
require 'faker'

# open ferry.db database
# create ferry database
ferry_db = SQLite3::Database.open("ferry.db")

# method to determine current local time, either for  hour or minute
# input:  database to use if we use method a to calculate time
#         'hour' or 'minute' to indicate if we should calculate hour or minute of current time
# output: integer 0-23 if hour requested
#         integer 0-59 if minute requested
# note: there are two ways we could get the time:
#    a) using the database's execute method to execute the following statement: "select strftime('%H %M','now','localtime');" 
#    b) using the ruby Time class
# both are programmed below as an academic exercise
def current_time(db_to_use,hour_or_minute)
  # method a
  # cmd_to_run = "select strftime('%H %M','now','localtime')" 
  # current_time = db_to_use.execute(cmd_to_run)
  # puts current_time
  # puts "class of current time is: #{current_time.class}"
  # puts "array of 0 is: #{current_time[0]}"
  # puts "array of 1 is: #{current_time[1]}"
  # puts "array of 0 of array of 0 is: #{current_time[0][0]}"
  # cur_time_array= current_time[0][0].split(' ')
  # puts "cur_time_array is #{cur_time_array}"
  # current_hour = cur_time_array[0].to_i
  # current_minute = cur_time_array[1].to_i

  # method b
  current_time = Time.now
  current_hour = current_time.hour
  current_minute = current_time.min
  if hour_or_minute == 'hour'
    current_hour
  else
    current_minute
  end
end

def get_user_info(db_to_use,user_name)
  # returns hash with all fields in user table if valid user; nil if not
  db_to_use.results_as_hash = true
  cmd_to_run = "SELECT * from users where user_name='#{user_name}'"
  # matching_user is an array holding all matching users - each matching user is itself an array
  # there should be either 0 or 1 matching users
  matching_user = db_to_use.execute(cmd_to_run)
  if matching_user.length == 0
    # no users match given user_name
    return nil
  else
    # return uid for given user_name
    # return matching_users[0][0]  # this is used if we get results as array instead of hash
    return matching_user
  end
end



puts "current hour function call: #{current_time(ferry_db,'hour')}" 
puts "current min function call: #{current_time(ferry_db,'minute')}" 
puts "get user info for Jorkin: #{get_user_info(ferry_db,'Jorkin')}"



