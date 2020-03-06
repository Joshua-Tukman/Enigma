require_relative "../test/test_helper"
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'


class EnigmaTest < Minitest::Test

  def test_it_exists
     enigma = Enigma.new
     assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_a_message_with_a_key_and_date

    enigma = Enigma.new
    expected = {
      encryption: "k*eder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("h*ello world!", "02715", "040895")
  end

  def test_it_can_decrypt_message_with_a_key_and_date
    enigma = Enigma.new
    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  # def test_it_can_encrypt_a_message_with_todays_date
  #   enigma = Enigma.new
  #   expected = {
  #     encryption: " " ,
  #     key: "02715",
  #     date: "060320"
  #   }
  #   assert_equal expected, enigma.encrypt("helloworld", "02715")
  #
  # end
end

# # encrypt a message with a key (uses today's date)
# pry(main)> encrypted = enigma.encrypt("hello world", "02715")
# #=> # encryption hash here
#
# #decrypt a message with a key (uses today's date)
# pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
# #=> # decryption hash here
#
# # encrypt a message (generates random key and uses today's date)
# pry(main)> enigma.encrypt("hello world")
# #=> # encryption hash here
