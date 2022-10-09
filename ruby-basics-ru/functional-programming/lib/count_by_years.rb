# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  years = users.select { |user| user[:gender] == 'male' }.map do |user|
    user[:birthday].split('-').first
  end
  years.tally
end
# END
