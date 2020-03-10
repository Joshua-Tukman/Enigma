require 'date'
require_relative "../test/test_helper"
require 'minitest/autorun'
require 'minitest/pride'
require './lib/date'

class DateTest < Minitest::Test

  def test_it_exists
    date = Date.new
    assert_instance_of Date, date
  end

  def test_it_has_a_date
    date = Date.new("040895")
    assert_equal "040895", date.date
  end

  def test_it_has_default_of_todays_date
    date = Date.new
    assert_equal "100320", date.date
  end

  def test_it_can_square_given_date
    date = Date.new("040895")
    assert_equal 1672401025, date.squared
  end

  def test_it_can_square_todays_date
    date = Date.new
    assert_equal 10064102400, date.squared
  end

  def test_it_can_return_last_four_of_date_squared
    date = Date.new
    assert_equal "2400", date.last_four
  end

  def test_it_can_make_an_A_offset
    date = Date.new
    assert_equal 2, date.a_offset
  end

  def test_it_can_make_an_B_offset
    date = Date.new
    assert_equal 4, date.b_offset
  end

  def test_it_can_make_an_c_offset
    date = Date.new
    assert_equal 0, date.c_offset
  end

  def test_it_can_make_an_d_offset
    date = Date.new
    assert_equal 0, date.d_offset
  end

end
