require './lib/enigma'

RSpec.describe Enigma do
  let(:enigma) { Enigma.new }

  describe '#initialize' do
    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end

    it 'generates an array of letters plus space' do
      expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    end
  end

  describe '#generate_random' do
    it 'generates a random five digit number' do
      first_number = enigma.generate_random
      second_number = enigma.generate_random

      expect(first_number).to_not eq(second_number)
      expect(enigma.random_number.digits.size).to eq(5)
      expect(enigma.random_number).to be_between(00000, 99999).inclusive
      expect(enigma.random_number).to be_a(Integer)
    end
  end

  describe '#generate_keys' do
    it 'generates keys based on random number' do
      allow(enigma).to receive(:random_number).and_return(54294)

      enigma.generate_keys
      
      expect(enigma.keys[:A]).to eq(54)
      expect(enigma.keys[:B]).to eq(42)
      expect(enigma.keys[:C]).to eq(29)
      expect(enigma.keys[:D]).to eq(94)
    end
  end

  describe '#fetch_date' do
    it 'returns todays date as an integer' do
      expect(enigma.fetch_date).to be_a(Integer)
      expect(enigma.fetch_date.to_s.length).to eq(6)
    end
  end

  describe '#generate_offsets' do
    it 'generates offsets based on todays date' do
      allow(enigma).to receive(:fetch_date).and_return(111122)

      enigma.parse_offset

      expect(enigma.offsets[:A]).to eq(8)
      expect(enigma.offsets[:B]).to eq(8)
      expect(enigma.offsets[:C]).to eq(8)
      expect(enigma.offsets[:D]).to eq(4)
    end
  end
end
