def mc(n)
  if n > 100
    n - 10
  else
    mc(mc(n+11))
  end
end

p mc(ARGV[0].to_i)
