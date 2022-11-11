require 'date'
class Enigma
  attr_reader :alphabet,
              :random_number,
              :a_key,
              :b_key,
              :c_key,
              :d_key,
              :a_offset,
              :b_offset,
              :c_offset,
              :d_offset

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @random_number = generate_random
  end

  def generate_random
    rand(99999).to_s.rjust(5, "0").to_i
  end

  def generate_keys
    @a_key = random_number.to_s.split("")[0..1].join.to_i
    @b_key = random_number.to_s.split("")[1..2].join.to_i
    @c_key = random_number.to_s.split("")[2..3].join.to_i
    @d_key = random_number.to_s.split("")[3..4].join.to_i
  end

  def date_to_offset
    squared_last_four = (fetch_date**2)
    squared_last_four.to_s[-4..-1].split("").map(&:to_i)
  end

  def parse_offset
    @a_offset, @b_offset, @c_offset, @d_offset = date_to_offset
  end

  def fetch_date
    Date.today.strftime('%d%m%y').to_i
  end
end