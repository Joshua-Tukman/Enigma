require_relative "../test/test_helper"
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'
require './lib/offset'

class EnigmaTest < Minitest::Test

  def test_it_exists
     enigma = Enigma.new
     assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_a_message_with_a_key_and_date
    enigma = Enigma.new
    key = Key.new("02715")

    expected = {
      encryption: "keder ohulw",
      key: key,
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", key, "040895")
  end

  def test_it_can_encrypt_with_non_alphabet_characters_at_beginning
    key = Key.new("02715")
    enigma = Enigma.new
    expected = {
      encryption: "$keder oh&ulw",
      key: key,
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("$hello wo&rld", key, "040895")
  end

  def test_it_can_encrypt_with_non_alphabet_characters_in_middle
    key = Key.new("02715")
    enigma = Enigma.new
    expected = {
      encryption: "keder, ohulw",
      key: key,
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello, world", key, "040895")
  end

  def test_it_can_encrypt_with_non_alphabet_characters_at_end
    key = Key.new("02715")
    enigma = Enigma.new
    expected = {
      encryption: "keder ohulw!",
      key: key,
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world!", key, "040895")
  end

  def test_it_can_decrypt_message_with_a_key_and_date
    key = Key.new("02715")
    enigma = Enigma.new
    expected = {
      decryption: "hello world!",
      key: key,
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw!", key, "040895")
  end

  def test_it_can_encrypt_a_message_with_todays_date
    key = Key.new("02715")
    enigma = Enigma.new
    expected = {
      encryption: "lib^s mcvpu" ,
      key: key,
      date: "080320"
    }
    assert_equal expected, enigma.encrypt("hello world", key)
  end

  def test_it_can_decrypt_message_with_todays_date
    key = Key.new("02715")
    enigma = Enigma.new
    encryption = {
      decryption: "hello world",
      key: key,
      date: "080320"
    }
    assert_equal encryption, enigma.decrypt("lib^s mcvpu", key)
  end
end
#
# # # encrypt a message with a key (uses today's date)
# # pry(main)> encrypted = enigma.encrypt("hello world", "02715")
# # #=> # encryption hash here
# #
# # #decrypt a message with a key (uses today's date)
# # pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
# # #=> # decryption hash here
# #
# # # encrypt a message (generates random key and uses today's date)
# # pry(main)> enigma.encrypt("hello world")
# # #=> # encryption hash here
