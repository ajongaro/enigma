require 'date'

class Enigma
  attr_reader :alphabet, :random_number, :key, :offset, :shift

  RANDOM_NUMBER = rand.to_s[2..6]
  GET_DATE = Date.today.strftime('%d%m%y')
  ALPHABET = ("a".."z").to_a << " " 

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @reverse_alphabet = @alphabet.reverse
    @random_number = generate_random
    @key = {} 
    @offset = {} 
    @shift = {}
  end

  def generator(key, date)
    generate_keys(key)
    generate_offsets(date)
    generate_shift
  end

  def determine_proper(shift)
    case shift
    when 1 then return @shift[:A]
    when 2 then return @shift[:B]
    when 3 then return @shift[:C]
    when 4 then return @shift[:D]
    end
  end

  def decrypt(message, key, date)
    generator(key, date)
    shift = 0
    output = []

    message.chars.each do |letter|
      shift += 1
      letter_position = @reverse_alphabet.find_index(letter) 

      new_alphabet = @reverse_alphabet.rotate(determine_proper(shift))
      output << new_alphabet[letter_position]
      shift = 0 if shift == 4
    end

    { decryption: output.join, key: key, date: date }
  end

  def encrypt(message, key=@random_number, date=fetch_date)
    generator(key, date)
    shift = 0
    output = []

    message.chars.each do |letter|
      shift += 1
      letter_position = @alphabet.find_index(letter) 

      new_alphabet = @alphabet.rotate(determine_proper(shift))
      output << new_alphabet[letter_position]
      shift = 0 if shift == 4
    end

    { encryption: output.join, key: key, date: date }
  end

  def generate_random
    rand(99999).to_s.rjust(5, "0")
  end

  def generate_shift
    @shift[:A] = @key[:A] + @offset[:A]
    @shift[:B] = @key[:B] + @offset[:B]
    @shift[:C] = @key[:C] + @offset[:C]
    @shift[:D] = @key[:D] + @offset[:D]
  end

  def generate_keys(provided_key)
    @key[:A] = provided_key.split("")[0..1].join.to_i
    @key[:B] = provided_key.split("")[1..2].join.to_i
    @key[:C] = provided_key.split("")[2..3].join.to_i
    @key[:D] = provided_key.split("")[3..4].join.to_i
  end

  def date_to_offset(date)
    (date.to_i**2).to_s[-4..-1].split("").map(&:to_i)
  end

  def generate_offsets(date=fetch_date)
    @offset[:A], @offset[:B], @offset[:C], @offset[:D] = date_to_offset(date)
  end

  def fetch_date
    Date.today.strftime('%d%m%y')
  end
end