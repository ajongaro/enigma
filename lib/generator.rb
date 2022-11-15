module Generator
  def generate_random
    rand(99999).to_s.rjust(5, "0")
  end

  def generate_shift(key, offset)
    @shift[1] = key[:A] + offset[:A]
    @shift[2] = key[:B] + offset[:B]
    @shift[3] = key[:C] + offset[:C]
    @shift[4] = key[:D] + offset[:D]
  end

  def date_to_offset(date)
    (date.to_i**2).to_s[-4..-1].split("").map(&:to_i)
  end

  def generate_keys_from(hash)
    key = {}
    key[:A] = hash.split("")[0..1].join.to_i
    key[:B] = hash.split("")[1..2].join.to_i
    key[:C] = hash.split("")[2..3].join.to_i
    key[:D] = hash.split("")[3..4].join.to_i
    key
  end

  def generate_offsets(date=GET_DATE)
    offset = {}
    offset[:A], offset[:B], offset[:C], offset[:D] = date_to_offset(date)
    offset
  end
end