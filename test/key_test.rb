require_relative "../test/test_helper"
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new("12345")
    assert_instance_of Key, key
  end

  def test_it_can_generate_a_random_key
    key = Key.new
    assert_equal 5, key.key.length
    assert (10000..100000).include?(key.key.to_i)
  end

  def test_it_has_a_key
    key = Key.new("12345")
    assert_equal "12345", key.key
  end

  def test_it_can_make_an_A_key
    key = Key.new("12345")
    assert_equal 12, key.a_key
  end

  def test_it_can_make_a_B_key
    key = Key.new("12345")
    assert_equal 23, key.b_key
  end

  def test_it_can_make_a_C_key
    key = Key.new("12345")
    assert_equal 34, key.c_key
  end

  def test_it_can_make_a_D_key
    key = Key.new("12345")
    assert_equal 45, key.d_key
  end
end
