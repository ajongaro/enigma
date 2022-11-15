require_relative 'generator'
require 'date'

class Enigma
  include Generator

  attr_reader :random_number, :shift

  GET_DATE = Date.today.strftime('%d%m%y')
  ALPHABET = ("a".."z").to_a << " " 
  R_ALPHABET = ALPHABET.reverse

  def initialize
    @random_number = generate_random
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
    !ALPHABET.include?(char)
  end

  # Add Test
  def crypt(message, key, date, alphabet)
    letters_from(message).map.with_index do |letter, index|
      if special?(letter)
        letter
      else
        location = alphabet.find_index(letter) 
        alphabet.rotate(@shift[(index % 4) + 1])[location]
      end
    end.join
  end

  def encrypt(message, key=@random_number, date=GET_DATE)
    build_shifts(key, date)
    { encryption: crypt(message, key, date, ALPHABET), key: key, date: date }
  end

  def decrypt(message, key, date)
    build_shifts(key, date)
    output = []
    count = 0

    letters_from(message).each do |letter|
      count += 1

      if special?(letter)
        output << letter
      else
        index = ALPHABET.find_index(letter) 
        output << ALPHABET.rotate(-@shift[count])[index]
      end

      count = 0 if count == 4
    end

    { decryption: output.join, key: key, date: date }
  end

  # def decrypt(message, key, date)
  #   build_shifts(key, date)
  #   output = []
  #   count = 0

  #   letters_from(message).each do |letter|
  #     count += 1

  #     if special?(letter)
  #       output << letter
  #     else
  #       index = ALPHABET.find_index(letter) 
  #       output << ALPHABET.rotate(-@shift[count])[index]
  #     end

  #     count = 0 if count == 4
  #   end

  #   { decryption: output.join, key: key, date: date }
  # end

  def date_to_offset(date)
    (date.to_i**2).to_s[-4..-1].split("").map(&:to_i)
  end
end