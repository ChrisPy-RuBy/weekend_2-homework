class Room

  attr_accessor :number_of_the_room, :current_song, :current_guest

  def initialize (number_of_the_room, current_song, current_guest)
  
    @number_of_the_room = number_of_the_room
    @current_song = current_song
    @current_guest = current_guest
    @playlist = []
    @guests_in_room = []

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

end