module Cryptic



  def parse_keys(key, provided_key)
    @key[:A] = provided_key.split("")[0..1].join.to_i
    @key[:B] = provided_key.split("")[1..2].join.to_i
    @key[:C] = provided_key.split("")[2..3].join.to_i
    @key[:D] = provided_key.split("")[3..4].join.to_i
  end



end