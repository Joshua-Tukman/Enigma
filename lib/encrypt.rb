require_relative 'enigma'
require_relative 'key'
require_relative 'date'
require_relative 'shift'

#ARGV == ["message.txt", "encrypted.txt"]


file = File.open(ARGV[0], "r")
x = file.read
file.close

enigma = Enigma.new

encrypted_message = enigma.encrypt(x, key = Key.new, date = Date.new)

new_file = File.open(ARGV[1], "w")
new_file.write(encrypted_message[:encryption])
new_file.close

puts "Created 'encrypted.txt' with the key #{key.key} and date #{date.date}"
