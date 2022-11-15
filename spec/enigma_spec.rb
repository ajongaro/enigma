require './lib/enigma'

RSpec.describe Enigma do
  let(:enigma) { Enigma.new }

  describe '#initialize' do
    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end
  end

  describe 'ALPHABET' do
    it 'is sorted from a to z letters plus space' do
      expect(Enigma::ALPHABET).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
                                      'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
    end
  end

  describe 'R_ALPHABET' do
    it 'is sorted from z to a beginning with space' do
      expect(Enigma::R_ALPHABET).to eq([' ', 'z', 'y', 'x', 'w', 'v', 'u', 't', 's', 'r', 'q', 'p', 'o', 'n', 'm', 'l',
                                        'k', 'j', 'i', 'h', 'g', 'f', 'e', 'd', 'c', 'b', 'a'])
    end
  end

  describe 'GET_DATE' do
    it 'returns todays date as string' do
      expect(Enigma::GET_DATE).to be_a(String)
      expect(Enigma::GET_DATE.length).to eq(6)
      expect(Enigma::GET_DATE).to eq(Date.today.strftime('%d%m%y'))
    end
  end

  describe '#decrypt' do
    it 'decrypts messages with key and date' do
      expect(enigma.decrypt('keder ohulw', '02715',
                            '040895')).to eq({ decryption: 'hello world', key: '02715', date: '040895' })
    end
  end

  describe '#encrypt' do
    it 'encrypts message from key and date' do
      expect(enigma.encrypt('hello world')).to be_a(Hash)
      expect(enigma.encrypt('hello world', '02715', '040895')).to be_a(Hash)
      expect(enigma.encrypt('hello world', '02715',
                            '040895')).to eq({ encryption: 'keder ohulw', key: '02715', date: '040895' })
      expect(enigma.encrypt('HeLLo wORld', '02715',
                            '040895')).to eq({ encryption: 'keder ohulw', key: '02715', date: '040895' })
    end

    it 'can take variable case messages' do
      expect(enigma.encrypt('HeLLo wORld', '02715',
                            '040895')).to eq({ encryption: 'keder ohulw', key: '02715', date: '040895' })
      expect(enigma.encrypt('B L ast OfF', '02715',
                            '040895')).to eq({ encryption: 'e dtdsltrfy', key: '02715', date: '040895' })
    end

    it 'can pass through special characters' do
      expect(enigma.encrypt('test.string', '02715',
                            '040895')).to eq({ encryption: 'wekm.slklnz', key: '02715', date: '040895' })
      expect(enigma.encrypt('<!testTEST!#*()@&!$%^ test', '02715',
                            '040895')).to eq({ encryption: '<!lyvtlyvt!#*()@&!$%^ lyvt', key: '02715', date: '040895' })
    end
  end
end
