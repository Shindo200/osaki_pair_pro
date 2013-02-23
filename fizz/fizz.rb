# coding utf-8
class Fizz
  def fb(n)
    retval = ""
    retval = "fizz" if n % 3 == 0
    retval += "buzz" if n % 5 == 0
    retval = n if retval == ""
    retval
  end

  def solve(n_from,n_to)
    (n_from..n_to).map { |n| fb(n) }
  end
end
