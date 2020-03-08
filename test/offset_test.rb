require_relative "../test/test_helper"
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new
    assert_instance_of Offset, offset
  end

  def test_it_has_a_date
    offset = Offset.new("040895")
    assert_equal "040895", offset.date
  end

  def test_it_has_default_of_todays_date
    offset = Offset.new
    assert_equal "080320", offset.date
  end

  def test_it_can_square_given_date
    offset = Offset.new("040895")
    assert_equal 1672401025, offset.squared
  end

  def test_it_can_square_todays_date
    offset = Offset.new
    assert_equal 6451302400, offset.squared
  end

  def test_it_can_return_last_four_of_date_squared
    offset = Offset.new
    assert_equal "2400", offset.last_four
  end

  def test_it_can_make_an_A_offset
    offset = Offset.new
    assert_equal 2, offset.a_offset
  end

  def test_it_can_make_an_B_offset
    offset = Offset.new
    assert_equal 4, offset.b_offset
  end




end
