# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  output = []
  for element in params.sort do
    output << element.join('=')
  end
  output.join('&')
end
# END
# rubocop:enable Style/For
