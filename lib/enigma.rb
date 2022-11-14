require 'date'

class Enigma
  attr_reader :alphabet, :random_number, :key, :offset, :shift

  def initialize
    @alphabet = ("a".."z").to_a << " "
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

  def determine_proper_shift(shift_number)
    case shift_number
    when 1 then return @shift[:A]
    when 2 then return @shift[:B]
    when 3 then return @shift[:C]
    when 4 then return @shift[:D]
    end
  end

  def encrypt(message, key=@random_number, date=fetch_date)
    generator(key, date)
    shift_number = 0
    output = []

    # convert message to letters 
    message_array = message.chars
    # access letter in letters 
    message_array.each do |letter|
    # find location of letter in @alphabet
      shift_number += 1
      letter_position = @alphabet.find_index(letter) 

      new_alphabet = @alphabet.rotate(determine_proper_shift(shift_number))
      output << new_alphabet[letter_position]

      shift_number = 0 if shift_number == 4
    end
    # add/rotate shift to that letter by proper shift
    # move letter_position shift times 
    # get the correct shift
    # do the correct thing with correct shift

    # shovel that new letter into a new array
    # join that array as a string
    # stuff all that and more into hash below

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