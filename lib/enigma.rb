class Enigma
  attr_reader :alphabet, :random_number

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @random_number = generate_random
  end

  def generate_random
    rand(99999).to_s.rjust(5, "0").to_i
  end
end