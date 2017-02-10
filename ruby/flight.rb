module Flight
  def take_off(altitude)
    puts "Taking off and ascending until reaching #{altitude} ..."
  end
end

class Bird
  # include Flight module so our Bird can take off
  include Flight
end

class Plane
  # include Flight module so our Plane can take off
  include Flight
end

# driver code to test
billy = Bird.new
billy.take_off(300)

united_354 = Plane.new
united_354.take_off(5000)