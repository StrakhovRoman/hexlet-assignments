# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return nil if start > stop

  output = []
  (start..stop).each do |num|
    str = ''
    str += 'Fizz' if (num % 3).zero?
    str += 'Buzz' if (num % 5).zero?
    output.push str.empty? ? num.to_s : str
  end
  output.join(' ')
end
# END
