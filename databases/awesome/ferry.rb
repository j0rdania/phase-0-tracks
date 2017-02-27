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
# later - add commits and rollbacks

##################   require    ###################################
# sqlite3 will be the database that holds user and ferry data. It will also hold a satisfaction log to 
# get user feedback about the site.

require 'sqlite3'
# faker is a gem that will assist in testing; it makes up fake test data
require 'faker'

##################  end require  #################################

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
    hour: current_time.hour,
    minutes: current_time.min,
    day_of_week_interval: day_of_week_span
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
  # negative numbers may be passed in. for example, 7,40,0,-50 (50 minutes before 7:40am) 
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
# OUTPUT: hash of hours and minutes needed for travel time to terminal
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
    hour: (min_travel_time_needed / 60),
    minutes: (min_travel_time_needed % 60)
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

  if (departure_hour > earliest_hour) ||
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
  # output: hash with three values: departure_hour, departure_minute, travel_time

  # calculate min travel time this user needs to get to the departing ferry terminal
  # results are a hash with hour and minutes keys
  min_travel_time_needed = minimum_travel_time_needed(db_to_use,this_user_info,departing_city)

  # get current hour, minute, and day of week
  now_values = current_time()

  # calculate earliest_arrival_time_at_terminal (EAT) if user left right now
  # current time plus travel time
  earliest_possible_terminal_arrival = add_two_times(
      now_values[:hour],
      now_values[:minutes],
      min_travel_time_needed[:hour],
      min_travel_time_needed[:minutes])

  # get all departure times leaving from specified city for specified day of week
  # order by departure time hour, then departure time minute, with earliest values first
  # departure_times is an array of hashes; each hash is an entry in the ferry schedule with the following keys:
  # departure_time_hour and departure_time_min
  db_to_use.results_as_hash = true
  cmd_to_run = "select departure_time_hour,departure_time_min from ferry_schedule where originating_city='#{departing_city}' and day_of_week='#{now_values[:day_of_week_interval]}' ORDER BY departure_time_hour, departure_time_min ASC"
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

  puts "last boat just reached in target_ferry_for_this_user; i is #{i}, departure_times at i is: #{departure_times[i]}"
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
    hour: departure_times[i]['departure_time_hour'],
    minutes: departure_times[i]['departure_time_min'],
    travel_time: min_travel_time_needed      # a hash with two keys: hour and minutes
  }
 end 

 def format_pretty_time_string(
  in_hour,
  in_minutes)
  # determine AM And PM, convert from 24 hour clock to 12 hour clock, return nicely formatted time string
  if in_hour > 12
    in_hour=in_hour - 12
    am_pm = 'PM'
  else
    am_pm='AM'
  end
  if in_minutes < 10
    in_minutes_string='0' + in_minutes.to_s
  else
    in_minutes_string=in_minutes.to_s 
  end
  return in_hour.to_s + ':' + in_minutes_string + ' ' + am_pm
end

def log_in(db_to_use)
  # get log in information from user and validate
  # INPUT: none
  # OUTPUT: user info hash if logged in successfully, nil otherwise

  # get user name
  valid_user_name_entered = false
  while  !valid_user_name_entered
    puts 'Enter your user name, type "forgot user name", or type "quit"'
    user_name = gets.chomp
    case user_name.downcase
      when 'forgot user name'
        # handle if user forgot user name
        # if email successfully matched and email sent, set reminder_email_sent to true
        puts "insert code here to send reminder email"
        return nil
      when 'quit'
        return nil 
      else
        # user name was entered; check validity of user name and get user information for entered user
        this_user_info = get_user_info(db_to_use,user_name)
        if this_user_info == nil 
          puts 'Invalid user name. Please try again.'
        else
          valid_user_name_entered = true
        end
    end
  end
  # get password
  valid_password_entered = false 
  reminder_email_sent = false 
  if valid_user_name_entered
    while !valid_password_entered
      puts 'Enter your password, type "forgot password", or type "quit"'
      password = gets.chomp
      if password.downcase == 'forgot password'
        # handle if user forgot password
        # if email successfully matched and email sent, set reminder_email_sent to true
        puts "insert code here to send reminder email"
        return nil
      elsif password.downcase == 'quit'
        return nil
      else
        # password was entered; check validity of password 
        if this_user_info['password'] == password
          valid_password_entered = true
        else
          puts 'Invalid password. Please try again.'
        end
      end
    end
  end
  # valid user name and password entered; return user info
  return this_user_info
end


####################################################    DRIVER CODE  ###################################################################### 


############  connect to database   ##################
# open ferry.db database
# create ferry database
ferry_db = SQLite3::Database.open("ferry.db")

############   end connect to database   ##############


puts 'Welcome to the awesome "What Time Should I Leave for the Ferry?" utility. Press any key for awesomeness!'
# ask user what he or she would like to do
valid_action_requested = false
while !valid_action_requested 
  puts 'Type "l" to log in, "c" to create a new account, or "q" to quit.'
  action_requested = gets.chomp
  if !['l','c','q'].include? action_requested.chars.first.downcase
    # user did not enter a valid choice
    puts "Not one of your awesome choices. Please try again."
  else
    valid_action_requested = true
  end
end
case action_requested.chars.first.downcase
  when 'q'
    # quit
  when 'c'
    # create new account
    puts 'about to create new account - insert code here'

  when 'l'
    # log in to existing account
    this_user_info = log_in(ferry_db)
    if this_user_info == nil 
      # log in failed
    else
      # log in successful
      puts "You\'re in, baby!"
      # user is now logged in - ask what he or she would like to do
      # options are:
      # "bi" = leave from Bainbridge
      # "sea" = leave from Seattle
      # "profile" = edit profile
      user_requested_quit = false
      while !user_requested_quit
        valid_logged_in_action_requested = false
        while !valid_logged_in_action_requested
          puts
          puts 'Type "b" to leave from Bainbrige Island'
          puts 'Type "s" to leave from Seattle'
          puts 'Type "p" to edit your profile'
          puts 'Type "q" to quit'
          action_requested = gets.chomp
          if !['b','s','p','q'].include? action_requested.chars.first.downcase 
            # user did not enter a valid choice
            puts "Not one of your awesome choices. Please try again."
          else
            valid_logged_in_action_requested = true
          end
        end
        case action_requested.chars.first.downcase
          when 'b','s'
            case action_requested.chars.first.downcase 
              when 'b'
                departing_city = 'Bainbridge Island'
              when 's'
                departing_city='Seattle'
            end
            # determine target ferry
            target_ferry = target_ferry_for_this_user(ferry_db,this_user_info,departing_city)
            
            # calculate leave time to catch target ferry, pass travel time as negative hours and negative minutes, 
            # because we want to subtract that time from the ferry departure time to get time to leave
            leave_time = add_two_times(target_ferry[:hour],target_ferry[:minutes],(-1 * (target_ferry[:travel_time][:hour])),( -1  * (target_ferry[:travel_time][:minutes])))
            # display results to user
            puts
            puts '************'
            puts "Leave at #{format_pretty_time_string(leave_time[:hour], leave_time[:minutes])} to catch the #{format_pretty_time_string(target_ferry[:hour],target_ferry[:minutes])} ferry. Happy sailing!"
            puts '************'
            puts
          when 'p'
            # edit profile
            done_editing = false
            while !done_editing
              valid_profile_action_entered = false
              while !valid_profile_action_entered
                puts 'Type "home" to update travel time from home to Bainbridge ferry terinal'
                puts 'Type "work" to update travel time from work to Colman Dock'
                puts 'Type "sprint" to update sprinting_okay flag'
                puts 'Type "name" to update first name'
                puts 'Type "user name" to update user name'
                puts 'Type "password" to update password'
                puts 'Type "quit" if you are done editing your profile'
                action_requested = gets.chomp.chars.first.downcase
                if !['h','w','s','n','u','p','q'].include? action_requested
                  # user did not enter a valid choice
                  puts "Not one of your awesome choices. Please try again."
                else
                  valid_profile_action_entered = true
                end
              end
              choose case action_requested
                when 'h'
                  # update time to travel from home to Bainbridge terminal
                  puts "Please enter new value for time to travel from home to Bainbridge terminal:"
                  new_value = gets.chomp
                  cmd_to_run="UPDATE users SET travel_time_house_to_terminal = #{new_value} WHERE uid = #{user_info['uid']}"
                  ferry_db.execute(cmd_to_run) 
                  if ferry_db.changes()  == 0
                    # no changes made
                    puts "Not so awesome: field not updated."
                  end
                when 'w'
                  # update time to travel from work to Colman Dock
                when 's'
                  # update sprinting_okay flag
                when 'n'
                  # update first name
                when 'u'
                  # update user name
                when 'p'
                  # change password
                when 'q'
                  # all done with profile changes
                  done_editing = true
              end

          end
        when 'q'
          # user would like to quit
          user_requested_quit = true
      end
    end
  end
end











