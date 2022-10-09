# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

# URL processing
class Url
  include Comparable
  extend Forwardable
  attr_reader :url

  def initialize(uri)
    @url = URI(uri)
  end

  def_delegators :@url, :host, :scheme

  def <=>(other)
    other.url.to_s <=> @url.to_s
  end

  def query_param(key, value = nil)
    query_params.fetch(key, value)
  end

  def query_params
    qs_to_hash(@url.query)
  end

  private

  def qs_to_hash(query_string)
    query_string.split('&').each_with_object({}) do |key_value_pair, output|
      key, value = key_value_pair.split('=')
      output[key.to_sym] = value
    end
  end
end
# END
