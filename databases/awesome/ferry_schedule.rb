# an array of arrays
# each of the inside array entries contains the following
# data:
#  originating city ('Bainbridge Island' or 'Seattle')
#  day of week ("S-S" or "S-S")
#  departure time (hour: 0-23)
#  departure time (minute: 0-59)

# later - handle other routes besides Bainbridge Island - Seattle
# later - need to handle last entry on official ferry scheudle (i.e. 12:55am ferry the next day)
# later - convert to live feed from WSDOT - will include seasonal schedule changes and delayed/cancelled ferry info
# later - display alerts to user (elevator out, ramp down, delayed ferries, etc.)
# later - handle midnight boat case (0,0)
# later - handle 7:55 ferry on Sunday mornings

FERRY_SCHEDULE = [
  ['Bainbridge Island','M-F','4','45'],
  ['Bainbridge Island','M-F','5','20'],
  ['Bainbridge Island','M-F','6','20'],
  ['Bainbridge Island','M-F','7','5'],
  ['Bainbridge Island','M-F','7','55'],
  ['Bainbridge Island','M-F','8','45'],
  ['Bainbridge Island','M-F','9','40'],
  ['Bainbridge Island','M-F','10','25'],
  ['Bainbridge Island','M-F','11','30'],
  ['Bainbridge Island','M-F','12','20'],
  ['Bainbridge Island','M-F','13','10'],
  ['Bainbridge Island','M-F','14','5'],
  ['Bainbridge Island','M-F','14','55'],
  ['Bainbridge Island','M-F','15','50'],
  ['Bainbridge Island','M-F','16','35'],
  ['Bainbridge Island','M-F','17','30'],
  ['Bainbridge Island','M-F','18','30'],
  ['Bainbridge Island','M-F','19','10'],
  ['Bainbridge Island','M-F','20','10'],
  ['Bainbridge Island','M-F','20','55'],
  ['Bainbridge Island','M-F','21','45'],
  ['Bainbridge Island','M-F','23','35'],
  ['Bainbridge Island','S-S','5','20'],
  ['Bainbridge Island','S-S','7','5'],
  ['Bainbridge Island','S-S','7','55'],
  ['Bainbridge Island','S-S','8','45'],
  ['Bainbridge Island','S-S','9','45'],
  ['Bainbridge Island','S-S','10','25'],
  ['Bainbridge Island','S-S','11','30'],
  ['Bainbridge Island','S-S','12','20'],
  ['Bainbridge Island','S-S','13','10'],
  ['Bainbridge Island','S-S','14','5'],
  ['Bainbridge Island','S-S','14','55'],
  ['Bainbridge Island','S-S','15','50'],
  ['Bainbridge Island','S-S','16','35'],
  ['Bainbridge Island','S-S','17','30'],
  ['Bainbridge Island','S-S','18','30'],
  ['Bainbridge Island','S-S','19','10'],
  ['Bainbridge Island','S-S','20','10'],
  ['Bainbridge Island','S-S','20','55'],
  ['Bainbridge Island','S-S','21','45'],
  ['Bainbridge Island','S-S','22','30'],
  ['Seattle','M-F','5','30'],
  ['Seattle','M-F','6','10'],
  ['Seattle','M-F','7','5'],
  ['Seattle','M-F','7','55'],
  ['Seattle','M-F','8','45'],
  ['Seattle','M-F','9','35'],
  ['Seattle','M-F','10','40'],
  ['Seattle','M-F','11','25'],
  ['Seattle','M-F','12','20'],
  ['Seattle','M-F','13','10'],
  ['Seattle','M-F','14','5'],
  ['Seattle','M-F','15','0'],
  ['Seattle','M-F','15','45'],
  ['Seattle','M-F','16','40'],
  ['Seattle','M-F','17','30'],
  ['Seattle','M-F','18','20'],
  ['Seattle','M-F','19','20'],
  ['Seattle','M-F','20','10'],
  ['Seattle','M-F','21','0'],
  ['Seattle','M-F','22','5'],
  ['Seattle','M-F','22','55'],
  ['Seattle','S-S','6','10'],
  ['Seattle','S-S','7','55'],
  ['Seattle','S-S','8','55'],
  ['Seattle','S-S','9','35'],
  ['Seattle','S-S','10','35'],
  ['Seattle','S-S','11','25'],
  ['Seattle','S-S','12','20'],
  ['Seattle','S-S','13','10'],
  ['Seattle','S-S','14','5'],
  ['Seattle','S-S','15','0'],
  ['Seattle','S-S','15','45'],
  ['Seattle','S-S','16','40'],
  ['Seattle','S-S','17','30'],
  ['Seattle','S-S','18','20'],
  ['Seattle','S-S','19','20'],
  ['Seattle','S-S','20','10'],
  ['Seattle','S-S','21','0'],
  ['Seattle','S-S','21','45'],
  ['Seattle','S-S','22','40'],
  ['Seattle','S-S','23','15']
]


