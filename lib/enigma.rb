require 'generator'
require 'date'

class Enigma
  include Generator

  attr_reader :random_number, :shift

  GET_DATE = Date.today.strftime('%d%m%y')
  ALPHABET = ("a".."z").to_a << " " 

  def initialize
    @random_number = generate_random
    @output = []
    @shift = {}
  end

  def build_shifts(key, date)
    keys = generate_keys_from(key)
    offsets = generate_offsets(date)
    generate_shift(keys, offsets)
  end

  # Add Test
  def letters_from(message)
    message.downcase.chars
  end

  # Add Test
  def special?(char)
    ALPHABET.include?(char)
  end

  def encrypt(message, key=@random_number, date=GET_DATE)
    build_shifts(key, date)
    count = 0

    letters_from(message).each do |letter|
      count += 1

      index = ALPHABET.find_index(letter) 
      @output << ALPHABET.rotate(@shift[count])[index]

      count = 0 if count == 4
    end

    { encryption: output.join, key: key, date: date }
  end

  def decrypt(message, key, date)
    build_shifts(key, date)
    count = 0

    letters_from(message).each do |letter|
      count += 1

      index = ALPHABET.find_index(letter) 
      @output << ALPHABET.rotate(-@shift[count])[index]

      count = 0 if count == 4
    end

    { decryption: @output.join, key: key, date: date }
  end

  def date_to_offset(date)
    (date.to_i**2).to_s[-4..-1].split("").map(&:to_i)
  end
end