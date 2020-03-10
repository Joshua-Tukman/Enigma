require_relative "../test/test_helper"
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'
require './lib/date'
require './lib/shift'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def test_it_exists
     enigma = Enigma.new
     assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_a_message_with_a_key_and_date
    date = Date.new("040895")
    enigma = Enigma.new
    key = Key.new("02715")

    expected = {
      encryption: "keder ohulw",
      key: key,
      date: date
    }

    assert_equal expected, enigma.encrypt("hello world", key, date)
  end

  def test_it_can_encrypt_a_message_with_uppercase_letters
    date = Date.new("040895")
    enigma = Enigma.new
    key = Key.new("02715")

    expected = {
      encryption: "keder ohulw",
      key: key,
      date: date
    }

    assert_equal expected, enigma.encrypt("HELLO WORLD", key, date)
  end

  def test_it_can_encrypt_with_non_alphabet_characters_at_beginning
    date = Date.new("040895")
    key = Key.new("02715")
    enigma = Enigma.new

    expected = {
      encryption: "$keder oh&ulw",
      key: key,
      date: date
    }

    assert_equal expected, enigma.encrypt("$hello wo&rld", key, date)
  end

  def test_it_can_encrypt_with_non_alphabet_characters_in_middle
    date = Date.new("040895")
    #date.stubs(:date).returns
    key = Key.new("02715")
    enigma = Enigma.new

    expected = {
      encryption: "keder, ohulw",
      key: key,
      date: date
    }

    assert_equal expected, enigma.encrypt("hello, world", key, date)
  end

  def test_it_can_encrypt_with_non_alphabet_characters_at_end
    date = Date.new("040895")
    key = Key.new("02715")
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw!",
      key: key,
      date: date
    }

    assert_equal expected, enigma.encrypt("hello world!", key, date)
  end

  def test_it_can_encrypt_a_message_with_todays_date_and_key
    date = Date.new
    key = Key.new("02715")
    enigma = Enigma.new

    expected = {
      encryption: "lib^s mcvpu" ,
      key: key,
      date: date
    }

    assert_equal expected, enigma.encrypt("hello world", key)
  end

  def test_it_can_decrypt_message_with_a_key_and_date
    date = Date.new("040895")
    key = Key.new("02715")
    enigma = Enigma.new

    expected = {
      decryption: "hello world!",
      key: key,
      date: date
    }

    assert_equal expected, enigma.decrypt("keder ohulw!", key, date)
  end
  def test_it_can_decrypt_message_with_todays_date
    date = Date.new
    key = Key.new("02715")
    enigma = Enigma.new

    encryption = {
      decryption: "hello world",
      key: key,
      date: date
    }

    assert_equal encryption, enigma.decrypt("lib^s mcvpu", key)
  end

  def test_it_can_encrypt_with_random_key_stubbed_and_todays_date
    date = Date.new
    key = Key.new
    enigma = Enigma.new

    expected = {
    encryption: "xmqud axgti!",
    key: key,
    date: date
    }
  key.stubs(:key).returns("95863")
  assert_equal expected, enigma.encrypt("hello world!", key, date)
  end

end
