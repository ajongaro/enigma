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

  def encrypt(message, key=random_number, date=fetch_date)
    generate_keys(key)

    
    
    { encryption: output, key: key, date: date }
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

  def generate_keys(provided_key=random_number)
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