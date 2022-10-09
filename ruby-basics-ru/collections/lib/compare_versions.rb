# frozen_string_literal: true

# BEGIN
def compare_versions(version1, version2)
  first = version1.split('.').map(&:to_i)
  second = version2.split('.').map(&:to_i)

  major = first[0] <=> second[0]
  minor = first[1] <=> second[1]

  major.zero? ? minor : major
end
# END
