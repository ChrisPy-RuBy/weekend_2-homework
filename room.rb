class Room

  attr_accessor :number_of_the_room, :current_song, :current_guest, :cost

  def initialize (number_of_the_room, current_song, current_guest, maximum_capacity, cost)

    @number_of_the_room = number_of_the_room
    @current_song = current_song
    @current_guest = current_guest
    @playlist = []
    @guests_in_room = []
    @maximum_capacity = maximum_capacity
    @cost = cost



  end


  def add_song(song)
    @playlist << song
  end

  def number_of_songs()
    @playlist.count()
  end

  def empty_room
    @guests_in_room.empty?
  end

  def add_guest_to_the_room(guest)
   @guests_in_room << guest
 end

 def number_of_guests
  @guests_in_room.count()
end

def remove_guest_from_the_room
  @guests_in_room.pop(1) 
end

def clear_room_completely
  @guests_in_room.clear()
end

def maximum_capacity_of_the_room
  return @maximum_capacity
end

def check_room_occupation_and_capacity() #could edit this to pop people out if there are too many until  it is at capacity again
  if @maximum_capacity == @guests_in_room.count()
    return "At capacity"
  elsif @maximum_capacity >= @guests_in_room.count()
    return "There is still some room"
  else
    return "Too many people"
  end
end

def cost_per_guest()
 return @cost / @guests_in_room.count()
end

def name_of_guest_in_room
  return @guests_in_the_room[0].guest_name
end

#  def guest_money(name)
#   name.money
# end

# def subtract_money_from_guest(guest_money)
#    guest_money -= 50
# end
  # 
# end 
  


end