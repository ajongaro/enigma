require 'generator'
require 'date'

class Enigma
  include Generator

  attr_reader :alphabet, :random_number, :key, :offset, :shift

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
    generate_keys_from(key)
    generate_offsets(date)
    generate_shift
  end

  def shift_for(shift)
    case shift
    when 1 then return @shift[:A]
    when 2 then return @shift[:B]
    when 3 then return @shift[:C]
    when 4 then return @shift[:D]
    end
  end

  def encrypt(message, key=@random_number, date=GET_DATE)
    generator(key, date)
    shift = 0
    output = []

    message.chars.each do |letter|
      shift += 1
      letter_position = @alphabet.find_index(letter) 

      output << @alphabet.rotate(shift_for(shift))[letter_position]
      shift = 0 if shift == 4
    end

    { encryption: output.join, key: key, date: date }
  end

  def decrypt(message, key, date)
    generator(key, date)
    shift = 0
    output = []

    message.chars.each do |letter|
      shift += 1
      letter_position = @reverse_alphabet.find_index(letter) 

      output << @reverse_alphabet.rotate(shift_for(shift))[letter_position]
      shift = 0 if shift == 4
    end

    { decryption: output.join, key: key, date: date }
  end

  def date_to_offset(date)
    (date.to_i**2).to_s[-4..-1].split("").map(&:to_i)
  end

  # def generate_offsets(date=GET_DATE)
  #   @offset[:A], @offset[:B], @offset[:C], @offset[:D] = date_to_offset(date)
  # end

end