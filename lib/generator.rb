module Generator
  def generate_random
    rand(99_999).to_s.rjust(5, '0')
  end

  def date_to_offset(date)
    (date.to_i**2).to_s[-4..-1].split('').map(&:to_i)
  end

  def generate_turns(key, date)
    keys = generate_keys_from(key)
    offsets = generate_offsets(date)
    generate_shifts(keys, offsets)
  end

  def generate_shifts(key, offset)
    (1..4).each do |num|
      @shift[num] = key[num] + offset[num]
    end
  end

  def generate_offsets(date=GET_DATE)
    offset = {}
    offset[1], offset[2], offset[3], offset[4] = date_to_offset(date)
    offset
  end

  def generate_keys_from(string)
    key = {}
    key[1] = string[0..1].to_i
    key[2] = string[1..2].to_i
    key[3] = string[2..3].to_i
    key[4] = string[3..4].to_i
    key
  end
end
