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
      expect(first_number.size).to eq(5)
      expect(first_number).to be_between("00000", "99999").inclusive
      expect(second_number).to be_a(String)
    end
  end

  describe '#generate_keys' do
    it 'generates keys based on random number' do
      allow(enigma).to receive(:random_number).and_return("54294")

      enigma.generate_keys("54294")
      
      expect(enigma.key[:A]).to eq(54)
      expect(enigma.key[:B]).to eq(42)
      expect(enigma.key[:C]).to eq(29)
      expect(enigma.key[:D]).to eq(94)
    end
  end

  describe '#fetch_date' do
    it 'returns todays date as string' do
      expect(enigma.fetch_date).to be_a(String)
      expect(enigma.fetch_date.length).to eq(6)
    end
  end

  describe '#generate_offsets' do
    it 'generates offsets based on todays date' do
      allow(enigma).to receive(:fetch_date).and_return(111122)

      enigma.generate_offsets()

      expect(enigma.offset[:A]).to eq(8)
      expect(enigma.offset[:B]).to eq(8)
      expect(enigma.offset[:C]).to eq(8)
      expect(enigma.offset[:D]).to eq(4)
    end
  end

  describe '#shift' do
    it 'combines final shift amount' do
      allow(enigma).to receive(:random_number).and_return("54294")
      allow(enigma).to receive(:fetch_date).and_return("111122")
      
      enigma.generate_offsets
      enigma.generate_keys
      enigma.generate_shift

      expect(enigma.shift[:A]).to eq(62)
      expect(enigma.shift[:B]).to eq(50)
      expect(enigma.shift[:C]).to eq(37)
      expect(enigma.shift[:D]).to eq(98)
    end
  end

  describe '#encrypt' do
    it 'encrypts stuff' do
      allow(enigma).to receive(:random_number).and_return("54294")
      allow(enigma).to receive(:fetch_date).and_return("111122")

      expect(enigma.encrypt('hello world')).to be_a(Hash)
      expect(enigma.encrypt('hello world')).to eq({ encryption: "keder ohulw", key: '54294', date: '111122' })
      expect(enigma.encrypt('hello world')).to be_a(Hash)
    end
  end
end
