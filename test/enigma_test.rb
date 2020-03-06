require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
     enigma = Enigma.new
     assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_a_message_with_a_key_and_date

    enigma = Enigma.new
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end
end
# pry(main)> require 'date'
# #=> true
#
# pry(main)> require './lib/enigma'
# #=> true
#
# pry(main)> enigma = Enigma.new
# #=> #<Enigma:0x00007ff90f24cb78...>
#
# # encrypt a message with a key and date
# pry(main)> enigma.encrypt("hello world", "02715", "040895")
# #=>
 # {
 #   encryption: "keder ohulw",
 #   key: "02715",
 #   date: "040895"
 # }
#
# # decrypt a message with a key and date
# pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
# #=>
# #   {
# #     decryption: "hello world",
# #     key: "02715",
# #     date: "040895"
# #   }
#
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