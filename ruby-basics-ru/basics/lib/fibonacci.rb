# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num <= 0
  return 0 if num == 1

  iter = lambda do |counter, acc, result|
    return result if counter == 1

    iter.call(counter - 1, result, result + acc)
  end
  iter.call(num, 1, 0)
end
# END
