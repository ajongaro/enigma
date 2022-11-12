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

  def generate_random
    rand(99999).to_s.rjust(5, "0").to_i
  end

  def generate_shift
    @shift[:A] = @key[:A] + @offset[:A]
    @shift[:B] = @key[:B] + @offset[:B]
    @shift[:C] = @key[:C] + @offset[:C]
    @shift[:D] = @key[:D] + @offset[:D]
  end

  def generate_keys
    @key[:A] = random_number.to_s.split("")[0..1].join.to_i
    @key[:B] = random_number.to_s.split("")[1..2].join.to_i
    @key[:C] = random_number.to_s.split("")[2..3].join.to_i
    @key[:D] = random_number.to_s.split("")[3..4].join.to_i
  end

  def date_to_offset
    (fetch_date**2).to_s[-4..-1].split("").map(&:to_i)
  end

  def generate_offsets
    @offset[:A], @offset[:B], @offset[:C], @offset[:D] = date_to_offset
  end

  def fetch_date
    Date.today.strftime('%d%m%y').to_i
  end
end