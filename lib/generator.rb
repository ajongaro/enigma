module Generator
  def generate_random
    rand(99999).to_s.rjust(5, "0")
  end

  def generate_shift(key, offset)
    (1..4).each do |num|
      @shift[num] = key[num] + offset[num]
    end
  end

  def date_to_offset(date)
    (date.to_i**2).to_s[-4..-1].split("").map(&:to_i)
  end

  def generate_keys_from(hash)
    key = {}
    key[1] = hash[0..1].to_i
    key[2] = hash[1..2].to_i
    key[3] = hash[2..3].to_i
    key[4] = hash[3..4].to_i
    key
  end

  def generate_offsets(date=GET_DATE)
    offset = {}
    offset[1], offset[2], offset[3], offset[4] = date_to_offset(date)
    offset
  end
end