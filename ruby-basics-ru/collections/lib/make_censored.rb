# frozen_string_literal: true

# rubocop:disable Style/For

def make_censored(text, stop_words)
  # BEGIN
  output = []
  for str in text.split do
    output.push stop_words.include?(str) ? '$#%!' : str
  end
  output.join(' ')
  # END
end

# rubocop:enable Style/For
