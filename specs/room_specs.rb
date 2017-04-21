require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../song.rb')


class TestClass < Minitest::Test

  def setup
    @room1 = Room.new(1, "no song", "empty")

  end

  def test_room_class_exists
    room = Room.new(1,  "no song", "empty")
    refute_nil(room)
  end

  def test_room_number
    assert_equal(1, @room1.number_of_the_room)
  end

  def test_current_song
    assert_equal("no song", @room1.current_song)
  end

  def test_current_guest
    assert_equal("empty", @room1.current_guest)
  end


  def test_add_song_to_playlist
    room = Room.new(1, "no song", "empty")
    room.add_song(@song1)
    assert_equal(1,room.number_of_songs)
  end

  def test_add_song_to_playlist
    room = Room.new(1,  "no song", "empty")
    room.add_song(@song1)
    room.add_song(@song2)
    assert_equal(2,room.number_of_songs)
  end

  def test_check_room_is_empty
    assert_equal(true,@room1.empty_room)
  end

  def test_a


end

  # def test_add_song_to_playlist_check_title
  #   room = Room.new(1, "no song", " free")
  #   room.add_song(@song1)
  #   assert_equal(,room.number_of_songs)


  # def test_add_song_to_currently_player
  #   room = Room.new(1 , "no song", " free")
  #   room.add_song(@song1)
  #   assert_equal("title", room.currently_playing)
  # end
