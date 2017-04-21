require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < Minitest::Test

def setup

  @guest1 = Guest.new("name", 10 )
  @guest2 = Guest.new("Alix", 10 )
  @guest3 = Guest.new("Chris",10 )
  @guest4 = Guest.new("Jack", 10 )
  @guest5 = Guest.new("Andy", 10 )
  @guest6 = Guest.new("Daniel", 10 )
  @guest7 = Guest.new("Matthew", 10 )
end


  def test_class_exists
    @guest1 = Guest.new("name", 10)
    refute_nil(@guest1)
  end

  def test_guest_name
    assert_equal("name", @guest1.guest_name)
  end

  def test_guest_different_name
    assert_equal("Alix", @guest2.guest_name)
  end

  def test_guest_set_name
  guest = Guest.new("Mary", 10)
  assert_equal("Mary", guest.guest_name)  
  end

end