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
