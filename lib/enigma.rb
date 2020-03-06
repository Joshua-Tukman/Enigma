require 'date'

class Enigma

  def encrypt(str, key, date)
    alphabet = ("a".."z").to_a << " "

    a_key = key[0..1].to_i
    b_key = key[1..2].to_i
    c_key = key[2..3].to_i
    d_key = key[3..4].to_i

    square = date.to_i ** 2
    last_four = square.to_s[-4..-1]

    a_offset = last_four[0].to_i
    b_offset = last_four[1].to_i
    c_offset = last_four[2].to_i
    d_offset = last_four[3].to_i

    a_shift = a_key + a_offset
    b_shift = b_key + b_offset
    c_shift = c_key + c_offset
    d_shift = d_key + d_offset
    shift_keys = [a_shift, b_shift, c_shift, d_shift]


    str.split("").each do |letter|
      count = 0
      old_index = alphabet.find_index(letter)
      new_index = old_index + a_shift
      count += 1
    end



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
