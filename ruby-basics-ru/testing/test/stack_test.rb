# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @empty_stack = Stack.new
    @stack = Stack.new(%w[one two three])
  end

  def test_stack_pop!
    assert { @empty_stack.pop!.nil? }
    assert { @stack.pop! == 'three' }
  end

  def test_stack_push!
    assert { @empty_stack.push!('one') == %w[one] }
    assert { @stack.push!('four') == %w[one two three four] }
  end

  def test_stack_empty?
    assert { @empty_stack.empty? == true }
    assert { @stack.empty? == false }
  end

  def test_stack_to_a
    assert { @empty_stack.to_a == [] }
    assert { @stack.to_a == %w[one two three] }
  end

  def test_stack_clear!
    assert { @stack.clear! == [] }
  end

  def test_stack_size
    assert { @empty_stack.size.zero? }
    assert { @stack.size == 3 }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
