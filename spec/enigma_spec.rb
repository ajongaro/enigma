require './lib/enigma'

RSpec.describe Enigma do
  let(:enigma) { Enigma.new }

  describe "#initialize" do
    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end

    it 'generates an array of letters plus space' do
      expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    end
  end

  describe "#generate_random" do
    it 'generates a random five digit number' do
      first_number = enigma.generate_random
      second_number = enigma.generate_random

      expect(first_number).to_not eq(second_number)
      expect(enigma.random_number.digits.size).to eq(5)
      expect(enigma.random_number).to be_a(Integer)
    end
  end

  describe "#generate_keys" do
    it 'generates keys based on random number' do
      allow(enigma).to receive(:random_number).and_return(54294)

      enigma.generate_keys
      
      expect(enigma.a_key).to eq(54)
      expect(enigma.b_key).to eq(42)
      expect(enigma.c_key).to eq(29)
      expect(enigma.d_key).to eq(94)
    end
  end

  describe "#fetch_date" do
    it 'returns todays date as an integer' do
      expect(enigma.fetch_date).to be_a(Integer)
      require 'pry'; binding.pry
      expect(enigma.fetch_date.to_s.length).to eq(6)
    end
  end
end
