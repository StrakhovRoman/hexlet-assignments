# frozen_string_literal: true

# BEGIN
def reverse(str)
  index = str.length - 1
  output = ''
  until index.negative?
    output += str[index]
    index -= 1
  end
  output
end
# END
