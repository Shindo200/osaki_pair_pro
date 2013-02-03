def mc(n)
  return n - 10 if n > 100
  mc(mc(n + 11))
end

p mc(ARGV[0].to_i)
