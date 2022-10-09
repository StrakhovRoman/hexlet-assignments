# frozen_string_literal: true

# BEGIN
def get_sorted_chars(word)
  word.chars.sort
end

def anagramm_filter(word, check_list)
  sorted_word = get_sorted_chars(word)
  check_list.select { |str| get_sorted_chars(str) == sorted_word }
end
# END
