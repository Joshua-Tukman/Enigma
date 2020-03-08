require_relative "../test/test_helper"
require 'minitest/autorun'
require 'minitest/pride'
require './lib/date'
require './lib/key'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_it_exists
    date = Date.new
    key = Key.new("02715")
    shift = Shift.new(key, date)
    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    date = Date.new
    key = Key.new("02715")
    shift = Shift.new(key, date)
    assert_equal "02715", shift.key.key
    assert_equal "080320", shift.date.date
  end

  def test_it_can_generate_A_shift
    date = Date.new
    key = Key.new("02715")
    shift = Shift.new(key, date)
    assert_equal 4, shift.a_shift
  end

  def test_it_can_generate_B_shift
    date = Date.new
    key = Key.new("02715")
    shift = Shift.new(key, date)
    assert_equal 31, shift.b_shift
  end

  def test_it_can_generate_C_shift
    date = Date.new
    key = Key.new("02715")
    shift = Shift.new(key, date)
    assert_equal 73, shift.c_shift
  end
end
