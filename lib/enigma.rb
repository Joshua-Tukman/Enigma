require 'date'

class Enigma
  def encrypt(str, key = Key.new(rand.to_s(2..6)), date = Date.new)
    shift = Shift.new(key, date)

    alphabet = ("a".."z").to_a << " "

    shift_keys = [shift.a_shift, shift.b_shift, shift.c_shift, shift.d_shift]

    message = []
    str.downcase.split("").each do |letter|
      if letter == " "
        message << " "
        shift_keys = shift_keys.rotate(1)
      elsif !alphabet.include?(letter)
        message << letter
      else
      old_index = alphabet.find_index(letter)
      new_letter = alphabet.rotate(old_index + shift_keys[0])[0]
        if new_letter == " "
          new_letter = "^"
        end
      message << new_letter
      shift_keys = shift_keys.rotate(1)
      end
    end
    acc = {encryption: message.join, key: key, date: date}
  end

  def decrypt(str, key, date = Date.new)
    shift = Shift.new(key, date)

    alphabet = ("a".."z").to_a << " "

    shift_keys = [shift.a_shift, shift.b_shift, shift.c_shift, shift.d_shift]

    message = []

    str.split("").each do |letter|

      if letter == " "
        message << " "
        shift_keys = shift_keys.rotate(1)

      elsif letter == "^"
        letter = " "

        old_index = alphabet.find_index(letter)
        new_letter = alphabet.rotate(old_index - shift_keys[0])[0]
        message << new_letter
        shift_keys = shift_keys.rotate(1)
      elsif !alphabet.include?(letter)

        message << letter
      else

        old_index = alphabet.find_index(letter)
        new_letter = alphabet.rotate(old_index - shift_keys[0])[0]
          message << new_letter
        shift_keys = shift_keys.rotate(1)
      end

      end
    acc = {decryption: message.join, key: key, date: date}
  end

end



 # def encrypt(message, key = nil, date = Date.today)
 #   acc = {encryption: "", key: 2digit_num, date: DDMMYY}
 # end


# Enigma#encrypt(message, key, date)
# The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption.
#If the key is not included, generate a random key. If the date is not included, use today’s date.
#
# The encrypt method returns a hash with three keys:
#
# :encryption => the encrypted String
# :key => the key used for encryption as a String
# :date => the date used for encryption as a String in the form DDMMYY
