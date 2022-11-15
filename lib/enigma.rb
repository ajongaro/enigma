require_relative 'generator'
require 'date'

class Enigma
  include Generator

  attr_reader :random_number, :shift

  GET_DATE = Date.today.strftime('%d%m%y')
  ALPHABET = ('a'..'z').to_a << ' '
  R_ALPHABET = ALPHABET.reverse

  def initialize
    @random_number = generate_random
    @shift = {}
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
  def crypt(message, _key, _date, alphabet)
    letters_from(message).map.with_index do |letter, index|
      if special?(letter)
        letter
      else
        location = alphabet.find_index(letter)
        alphabet.rotate(@shift[(index % 4) + 1])[location]
      end
    end.join
  end

  def encrypt(message, key = @random_number, date = GET_DATE)
    build_shifts(key, date)

    {
      encryption: crypt(message, key, date, ALPHABET),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date)
    build_shifts(key, date)

    {
      decryption: crypt(message, key, date, R_ALPHABET),
      key: key,
      date: date
    }
  end
end
