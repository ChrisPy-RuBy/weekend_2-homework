require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < Minitest::Test

def setup

  @guest1 = Guest.new("name")
  @guest2 = Guest.new("Brian")
end


  def test_class_exists
    @guest1 = Guest.new("name")
    refute_nil(@guest1)
  end

  def test_guest_name
    assert_equal("name", @guest1.guest_name)
  end

  def test_guest_different_name
    assert_equal("Brian", @guest2.guest_name)
  end

  def test_guest_set_name
  guest = Guest.new("Mary")
  assert_equal("Mary", guest.guest_name)  
  end

end