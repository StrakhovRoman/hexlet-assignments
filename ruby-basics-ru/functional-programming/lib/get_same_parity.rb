# frozen_string_literal: true

# BEGIN
def get_same_parity(sequence)
  return sequence if sequence.empty?

  parity = sequence.first.even?
  sequence.select { |num| parity ? num.even? : num.odd? }
end
# END
