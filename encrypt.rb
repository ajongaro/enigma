require_relative './lib/enigma'

enigma = Enigma.new

encrypted_file = File.open(ARGV[1], 'w')
encryption = enigma.encrypt(File.read(ARGV[0]))
encrypted_file.write(encryption[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
