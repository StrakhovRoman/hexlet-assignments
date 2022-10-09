# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  # Add methods to metaclass.
  module ClassMethods
    def attribute(name, options)
      @scheme ||= {}
      @scheme[name] = options

      define_method name do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        @attributes[name] = convert(value, options[:type])
      end
    end

    attr_reader :scheme
  end

  def convert(value, type)
    return nil if value.nil?
    return value if type.nil?

    case type
    when :integer then value.to_i
    when :string then value.to_s
    when :boolean then value.to_s.downcase == 'true'
    when :datetime then DateTime.parse(value)
    end
  end

  def initialize(params = {})
    @attributes = {}
    self.class.scheme.each do |name, options|
      @attributes[name] =
        if params.key?(name)
          convert(params[name], options[:type])
        else
          options[:default]
        end
    end
  end

  attr_reader :attributes
end
# END
