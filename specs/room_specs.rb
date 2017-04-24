require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')


class TestClass < Minitest::Test

  def setup
    @room1 = Room.new(1, "no song", "empty", 6, 50)

    @rich_pete = Guest.new("pete", 100)

  end

  def test_room_class_exists
    room = Room.new(1,  "no song", "empty", 6, 50)
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
    @room1.add_song(@song1)
    assert_equal(1,@room1.number_of_songs)
  end

  def test_add_song_to_playlist
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal(2,@room1.number_of_songs)
  end

  def test_check_room_is_empty
    assert_equal(true,@room1.empty_room)
  end

  def test_add_person_to_a_room

    @room1.add_guest_to_the_room(@guest2)
    assert_equal(1, @room1.number_of_guests)
  end

  def test_add_six_people_to_a_room
    @room1.add_guest_to_the_room(@guest1)
    @room1.add_guest_to_the_room(@guest2)
    @room1.add_guest_to_the_room(@guest3)
    @room1.add_guest_to_the_room(@guest4)
    @room1.add_guest_to_the_room(@guest5)
    @room1.add_guest_to_the_room(@guest6)
    assert_equal(6, @room1.number_of_guests)
  end

  def test_add_8_people_to_a_room
    @room1.add_guest_to_the_room(@guest1)
    @room1.add_guest_to_the_room(@guest2)
    @room1.add_guest_to_the_room(@guest3)
    @room1.add_guest_to_the_room(@guest4)
    @room1.add_guest_to_the_room(@guest5)
    @room1.add_guest_to_the_room(@guest6)
    assert_equal(6, @room1.number_of_guests)
    @room1.add_guest_to_the_room(@guest5)
    @room1.add_guest_to_the_room(@guest6)
    assert_equal(8, @room1.number_of_guests)
  end

  def test_get_one_person_leave
    @room1.add_guest_to_the_room(@guest1)
    @room1.add_guest_to_the_room(@guest2)
    @room1.add_guest_to_the_room(@guest3)
    @room1.add_guest_to_the_room(@guest4)
    @room1.add_guest_to_the_room(@guest5)
    @room1.add_guest_to_the_room(@guest6)
    assert_equal(6, @room1.number_of_guests)
    @room1.remove_guest_from_the_room
    assert_equal(5, @room1.number_of_guests)
  end

  def test_clear_whole_room
    @room1.add_guest_to_the_room(@guest1)
    @room1.add_guest_to_the_room(@guest2)
    @room1.add_guest_to_the_room(@guest3)
    @room1.add_guest_to_the_room(@guest4)
    @room1.add_guest_to_the_room(@guest5)
    @room1.add_guest_to_the_room(@guest6)
    assert_equal(6, @room1.number_of_guests)
    @room1.clear_room_completely
    assert_equal(0, @room1.number_of_guests)
  end

  def test_what_is_maximum_capacity_of_the_room
    @room1.maximum_capacity_of_the_room
    assert_equal(6, @room1.maximum_capacity_of_the_room)
  end

  def test_is_the_room_over_capacity_at_capacity
    @room1.add_guest_to_the_room(@guest1)
    @room1.add_guest_to_the_room(@guest2)
    @room1.add_guest_to_the_room(@guest3)
    @room1.add_guest_to_the_room(@guest4)
    @room1.add_guest_to_the_room(@guest5)
    @room1.add_guest_to_the_room(@guest6)
    assert_equal(6, @room1.number_of_guests)
    assert_equal("At capacity", @room1. check_room_occupation_and_capacity)
  end

  def test_is_the_room_over_capacity_not_enough_people
    @room1.add_guest_to_the_room(@guest1)
    assert_equal(1, @room1.number_of_guests)
    assert_equal("There is still some room", @room1. check_room_occupation_and_capacity)
  end

  def test_is_the_room_over_capacity_not_to_many_people
    @room1.add_guest_to_the_room(@guest1)
    @room1.add_guest_to_the_room(@guest2)
    @room1.add_guest_to_the_room(@guest3)
    @room1.add_guest_to_the_room(@guest4)
    @room1.add_guest_to_the_room(@guest5)
    @room1.add_guest_to_the_room(@guest6)
    @room1.add_guest_to_the_room(@guest7)
    assert_equal(7, @room1.number_of_guests)
    assert_equal("Too many people", @room1. check_room_occupation_and_capacity)
  end

  def test_charge_per_room
    assert_equal(50, @room1.cost)
  end

  def test_cost_per_guest_test_1
    @room1.add_guest_to_the_room(@guest1)
    assert_equal(1, @room1.number_of_guests)
    assert_equal(50, @room1.cost_per_guest)
  end

  def test_cost_per_guest_test_2
    @room1.add_guest_to_the_room(@guest1)
    @room1.add_guest_to_the_room(@guest2)
    @room1.add_guest_to_the_room(@guest3)
    @room1.add_guest_to_the_room(@guest4)
    @room1.add_guest_to_the_room(@guest5)
    assert_equal(5, @room1.number_of_guests)
    assert_equal(10, @room1.cost_per_guest)
  end

  def test_first_guest_in_room_name
    @room1.add_guest_to_the_room(@guest1)
    assert_equal("name", @room1.name_of_guest_in_room)
  end
  # def test_money_for_specific_guest
  #   assert_equal(100, @rich_pete.money)
  # end

# def test_adding_and_subtracting_money_from_guest
#   @room1.subtract_money_from_guest(@room1.cost, @rich_pete.money)
#   assert_equal(50, @rich_pete.money)
# end



 # def test_adding_and_subtracting_money_from_guest
 #   @rich_pete.subtract_money_from_guest(@rich_pete.money)
 #   assert_equal(50, @rich_pete.money)
 # end

end





  # def test_total_money_individual_guest_has
  #     @room1.add_guest_to_the_room(@guest1)
  #     assert_equal(1, @room1.number_of_guests)
  #     assert_equal(50,@room1.check_amount_of_money_guest_has(@guest1))
  # end

  # def test_charge_per_person_in_group
  #      @room1.add_guest_to_the_room(@guest1)
  #      assert_equal(1, @room1.number_of_guests)
  #      @room1.cost_per_guest
  #      assert_equal(50, @room1.cost_per_guest)
  #      assert_equal(0, @room1.guest_pays)
  # # end

  # def test_money_guest_has

  # # def test_check_guest_array()
  # #  check_guest_array
  # # end
#end

