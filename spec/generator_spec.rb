require './lib/generator'

RSpec.describe Generator do
  let(:enigma) { Enigma.new }

  describe '#generate_random' do
    it 'generates a random five digit number' do
      first_number = enigma.generate_random
      second_number = enigma.generate_random

      expect(first_number).to_not eq(second_number)
      expect(first_number.size).to eq(5)
      expect(first_number).to be_between('00000', '99999').inclusive
      expect(second_number).to be_a(String)
    end
  end

  describe '#generate_keys_from' do
    it 'generates keys based on random number' do
      key = enigma.generate_keys_from('54294')

      expect(key[1]).to eq(54)
      expect(key[2]).to eq(42)
      expect(key[3]).to eq(29)
      expect(key[4]).to eq(94)
    end
  end

  describe 'date_to_offset()' do
    it 'modifies date to offset keys' do
      expect(enigma.date_to_offset('111122')).to eq([8, 8, 8, 4])
      expect(enigma.date_to_offset('040799')).to eq([8, 4, 0, 1])
      expect(enigma.date_to_offset('010301')).to eq([0, 6, 0, 1])
    end
  end

  describe '#generate_offsets' do
    it 'generates offsets based on date' do
      offsets = enigma.generate_offsets('111122')

      expect(offsets[1]).to eq(8)
      expect(offsets[2]).to eq(8)
      expect(offsets[3]).to eq(8)
      expect(offsets[4]).to eq(4)
    end
  end

  describe '#generate_shifts' do
    it 'combines final shift amounts' do
      offsets = enigma.generate_offsets('111122')
      keys = enigma.generate_keys_from('54294')

      enigma.generate_shifts(keys, offsets)

      expect(enigma.shift[1]).to eq(62)
      expect(enigma.shift[2]).to eq(50)
      expect(enigma.shift[3]).to eq(37)
      expect(enigma.shift[4]).to eq(98)
    end
  end

  describe '#generate_shifts' do
    it 'combines final shift amounts' do
      offsets = enigma.generate_offsets('111122')
      keys = enigma.generate_keys_from('54294')

      enigma.generate_shifts(keys, offsets)

      expect(enigma.shift[1]).to eq(62)
      expect(enigma.shift[2]).to eq(50)
      expect(enigma.shift[3]).to eq(37)
      expect(enigma.shift[4]).to eq(98)
    end
  end
end
