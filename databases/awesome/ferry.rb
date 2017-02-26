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

# later - handle other routes besides Bainbridge Island - Seattle
# later - need to handle last entry on official ferry scheudle (i.e. 12:55am ferry the next day)
# later - convert to live feed from WSDOT - will include seasonal schedule changes and delayed/cancelled ferry info
# later - display alerts to user (elevator out, ramp down, delayed ferries, etc.)
# later - handle midnight boat case (0,0)
# later - handle 7:55 ferry on Sunday mornings

##################   require    ###################################
# sqlite3 will be the database that holds user and ferry data. It will also hold a satisfaction log to 
# get user feedback about the site.

require 'sqlite3'
# faker is a gem that will assist in testing; it makes up fake test data
require 'faker'

##################  end require  #################################

# open ferry.db database
# create ferry database
ferry_db = SQLite3::Database.open("ferry3.db")

def current_time()
  # method to determine current local time and day of week
# input:  database to use if we use method a to calculate time
#         'hour' or 'minute' or 'day_of_week' to indicate what should be calculated
# output: hash with three keys:
#           current_hour: integer 0-23 
#           current_minute: integer 0-59 
#           today_day_of_week: 'M-F' or 'S-S'

# note: there are two ways we could get the time:
#    a) using the database's execute method to execute the following statement: "select strftime('%H %M','now','localtime');" 
#    b) using the ruby Time class
# both are programmed below as an academic exercise

  # method a  - assumes db_to_use would be passed into this method

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
  case current_time.wday
    when 0,6
      day_of_week_span = 'S-S'
    when 1..5
      day_of_week_span = 'M-F'
    end
  now_values = {
    current_hour: current_time.hour,
    current_minute: current_time.min,
    today_day_of_week: day_of_week_span
  }
end

def get_user_info(
  db_to_use,
  user_name)
  # returns hash with all fields in user table if valid user; nil if not
  db_to_use.results_as_hash = true
  cmd_to_run = "SELECT * from users where user_name='#{user_name}'"
  # matching_user is an array holding all matching users - each matching user is itself an array
  # there should be either 0 or 1 matching users
  matching_user = db_to_use.execute(cmd_to_run)
  # reset results method to non-hash
  db_to_use.results_as_hash = false
  if matching_user.length == 0
    # no users match given user_name
    return nil
  else
    # return matching_users[0][0]  # this would be used to return uid if we get results as array instead of hash
    return matching_user[0]
  end
end

def add_two_times(
  hour1,
  min1,
  hour2,
  min2)
  # return hash with result_hour and result_min
  # negative numbers may be passed in. for example, 7,40,0,50 (50 minutes before 7:40am) 
  # would give a result of 6:50 (6 for hour, 50 for minutes)
  # later, we need to handle if adding the two times results in the next day
  new_hour = hour1 + hour2
  new_min = min1 + min2
  if new_min >= 60
    new_min = new_min - 60
    new_hour = new_hour + 1
  elsif new_min < 0
    new_min = new_min + 60
    new_hour = new_hour - 1
  end
  return_time={
    hour: new_hour,
    minutes: new_min
  }
end

def minimum_travel_time_needed(
  db_to_use,
  this_user_info,
  departing_city)
# calculate minimum travel time needed. 
# If this user is not willing to sprint, add two minutes travel time as wiggle room.
# INPUT: database to use, hash of user info for this user, city that user wants to depart from
# OUTPUT: hash of hours_needed and minutes needed for travel time to terminal
  case departing_city
    when 'Bainbridge Island'
      min_travel_time_needed = this_user_info['travel_time_house_to_terminal']
    when 'Seattle'
      min_travel_time_needed = this_user_info['travel_time_work_to_terminal']
  end
  if this_user_info['sprinting_okay'] == 'false'
    min_travel_time_needed += 2
  end
  # convert min_travel_time_needed from minutes to hours and minutes
  return_interval = {
    hours_needed: (min_travel_time_needed / 60),
    minutes_needed: (min_travel_time_needed % 60)
  }
end

def this_is_the_target_ferry?(
  db_to_use,
  departure_hour,
  departure_min,
  earliest_hour,
  earliest_min,
  originating_city)
  # this method determines if the given ferry is the correct target ferry
  # if the departure hour >= EAT (earliest arrival time) hour or (the departure hour = EAT hour and the departure min >= EAT minutes), then
  # the user can catch this ferry if he or she leaves now

  if (departure_hour >= earliest_hour) ||
    ((departure_hour == earliest_hour) &&
    (departure_min >= earliest_min))
    true 
  else
    false
  end
end

def target_ferry_for_this_user(
  db_to_use,
  this_user_info,
  departing_city)
  # add this user's travel time to the current time to get
  # the earliest ferry that could be caught if he or she leaves
  # right now. 
  # input: ferry_db to use, a hash of user info for this user, and departing city
  # output: hash with two values: departure_hour and departure_minute

  # look up how many minutes this user needs to get to the departing ferry terminal
  min_travel_time_needed = minimum_travel_time_needed(db_to_use,this_user_info,departing_city)

  # get current hour, minute, and day of week
  now_values = current_time()
 
  # calculate earliest_arrival_time_at_terminal (EAT) if user left right now
  # current time plus travel time

  earliest_possible_terminal_arrival = add_two_times(now_values[:current_hour],now_values[:current_minute],min_travel_time_needed[:hours_needed],min_travel_time_needed[:minutes_needed])

  # get all departure times leaving from specified city for specified day of week
  # order by departure time hour, then departure time minute, with earliest values first
  # departure_times is an array of hashes; each hash is an entry in the ferry schedule with the following keys:
  # departure_time_hour and departure_time_min
  db_to_use.results_as_hash = true
  cmd_to_run = "select departure_time_hour,departure_time_min from ferry_schedule where originating_city='#{departing_city}' and day_of_week='#{now_values[:today_day_of_week]}' ORDER BY departure_time_hour, departure_time_min ASC"
  departure_times = db_to_use.execute(cmd_to_run)

  # cycle through departures array for this departing city, which is sorted by departure hour, then departure minutes 
  i = 0
  last_boat_reached = false
  until (last_boat_reached) || (this_is_the_target_ferry?(       
                                db_to_use,
                                departure_times[i]['departure_time_hour'],
                                departure_times[i]['departure_time_min'],
                                earliest_possible_terminal_arrival[:hour],
                                earliest_possible_terminal_arrival[:minutes],
                                departing_city))
   if i == (departure_times.length - 1)
      last_boat_reached = true
    else
      # repeat with next departure time
      i += 1
    end
  end
  if last_boat_reached 
    # if we got all the way to the end of the array, and there were no ferries found, then we should choose
    # the first element of the array - it will be the morning ferry the next day. Note: if today is a Friday, then we will need
    # to get the weekend schedule first. Likewise, if today is a Sunday, we will need to get the weekday schedule first.
    case now_values[today_day_of_week]
      when 0
        # today is Sunday - get weekday departure schedule
        cmd_to_run = "select departure_time_hour,departure_time_min from ferry_schedule where originating_city='#{departing_city}' and day_of_week='M-F' ORDER BY departure_time_hour, departure_time_min ASC"
        departure_times = db_to_use.execute(cmd_to_run)
      when 5
        # today is Friday - get weekend departure schedule
        cmd_to_run = "select departure_time_hour,departure_time_min from ferry_schedule where originating_city='#{departing_city}' and day_of_week='S-S' ORDER BY departure_time_hour, departure_time_min ASC"
        departure_times = db_to_use.execute(cmd_to_run)
      else
        # we can use the same departure schedule - just look at the first element
    end
    i = 0
  end

  # return this departure time entry
  target_ferry = {
    departure_hour: departure_times[i]['departure_time_hour'],
    departure_minute: departure_times[i]['departure_time_min']
  }
 end 

#############    DRIVER CODE  ####################
# puts "Please enter user name"
# user_name=gets.chomp
user_name='Jorkin'
# get user information for entered user
this_user_info = get_user_info(ferry_db,user_name)
if this_user_info == nil 
  puts 'Invalid user name'
end

# puts "Please enter departing city"
# departing_city = gets.chomp
departing_city='Bainbridge Island'

# now we've got user information and departing city
puts target_ferry_for_this_user(ferry_db,this_user_info,departing_city)











