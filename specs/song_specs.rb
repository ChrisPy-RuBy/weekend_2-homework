require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < Minitest::Test

def setup
  @song1 = Song.new("title", "band")
  @song2 = Song.new("Thunderstruck", "AC/DC")
  @song3 = Song.new("Bat out of hell", "Meatloaf")
end

def test_class_exists
  @song = Song.new("title", "band")
  refute_nil(@song)
end

def test_song_title
  #make sure that the instance variable title in the setup is the same as that having the method being called on it
  assert_equal("title", @song1.song_title)
end

def test_song_title_different
  #make sure that the instance variable title in the setup is the same as that having the method being called on it
  assert_equal("Thunderstruck", @song2.song_title)
end

def test_band_name
  assert_equal("band", @song1.band)
end

def test_band_name_different
  assert_equal("AC/DC", @song2.band)
end

end