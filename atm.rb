def atm(total, denom)
  data = denom.inject({}) do |hash, denom|
    hash[denom] = total.divmod(denom)
    total -= total.divmod(denom).first * denom
    hash
  end

  data.map {|k, v| data[k] = v.first}
  data
end

p atm(1045, [100,20,10,5])
