require './lib/enigma'

RSpec.describe Enigma do
  let(:enigma) { Enigma.new }

  describe '#initialize' do
    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end

    it 'generates an array of letters plus space' do
      expect(Enigma::ALPHABET).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
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

  describe '#generate_keys_from' do
    it 'generates keys based on random number' do
      key = enigma.generate_keys_from("54294")
      
      expect(key[:A]).to eq(54)
      expect(key[:B]).to eq(42)
      expect(key[:C]).to eq(29)
      expect(key[:D]).to eq(94)
    end
  end

  describe 'GET_DATE' do
    it 'returns todays date as string' do
      expect(Enigma::GET_DATE).to be_a(String)
      expect(Enigma::GET_DATE.length).to eq(6)
    end
  end

  describe '#generate_offsets' do
    it 'generates offsets based on date' do
      offsets = enigma.generate_offsets('111122')

      expect(offsets[:A]).to eq(8)
      expect(offsets[:B]).to eq(8)
      expect(offsets[:C]).to eq(8)
      expect(offsets[:D]).to eq(4)
    end
  end

  describe '#build_shifts' do
    it 'combines final shift amounts' do
      offsets = enigma.generate_offsets('111122')
      keys = enigma.generate_keys_from('54294')

      enigma.generate_shift(keys, offsets)

      expect(enigma.shift[1]).to eq(62)
      expect(enigma.shift[2]).to eq(50)
      expect(enigma.shift[3]).to eq(37)
      expect(enigma.shift[4]).to eq(98)
    end
  end

  describe '#decrypt' do
    it 'decrypts messages with key and date' do
      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq({ decryption: 'hello world', key: '02715', date: '040895' })
    end
  end

  describe '#encrypt' do
    it 'encrypts message from key and date' do
      expect(enigma.encrypt('hello world', "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt('hello world', "02715", "040895")).to eq({ encryption: "keder ohulw", key: '02715', date: '040895' })
      expect(enigma.encrypt('hello world')).to be_a(Hash)
    end
  end
end
