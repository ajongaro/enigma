class Enigma
  attr_reader :alphabet,
              :random_number,
              :a_key,
              :b_key,
              :c_key,
              :d_key

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
end