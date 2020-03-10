require_relative 'enigma'
require_relative 'key'
require_relative 'date'
require_relative 'shift'

#ARGV == ["encrypted.txt", "decrypted.txt", "key", "date"]


file = File.open(ARGV[0], "r")
x = file.read
file.close

enigma = Enigma.new

decrypted_message = enigma.decrypt(x, key = Key.new(ARGV[2]), date = Date.new(ARGV[3]))

new_file = File.open(ARGV[1], "w")
new_file.write(decrypted_message[:decryption])
new_file.close

puts "Created 'decrypted.txt' with the key #{key.key} and date #{date.date}"
