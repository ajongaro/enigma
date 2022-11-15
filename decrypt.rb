require_relative './lib/enigma'

enigma = Enigma.new
encrypted_file = File.read(ARGV[0])

decrypted = enigma.decrypt(encrypted_file, ARGV[2], ARGV[3])
file = File.open(ARGV[1], 'w')
file.write(decrypted[:decryption])

puts "Created '#{ARGV[1]}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
