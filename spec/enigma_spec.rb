require './lib/enigma'

RSpec.describe Enigma do
  let(:enigma) { Enigma.new }

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'generates an array of letters plus space' do
    expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end
end