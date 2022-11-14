module Generator
  def generate_random
    rand(99999).to_s.rjust(5, "0")
  end

  def generate_shift
    @shift[:A] = @key[:A] + @offset[:A]
    @shift[:B] = @key[:B] + @offset[:B]
    @shift[:C] = @key[:C] + @offset[:C]
    @shift[:D] = @key[:D] + @offset[:D]
  end

  def generate_keys_from(hash)
    @key[:A] = hash.split("")[0..1].join.to_i
    @key[:B] = hash.split("")[1..2].join.to_i
    @key[:C] = hash.split("")[2..3].join.to_i
    @key[:D] = hash.split("")[3..4].join.to_i
  end

  def generate_offsets(date=GET_DATE)
    @offset[:A], @offset[:B], @offset[:C], @offset[:D] = date_to_offset(date)
  end
end