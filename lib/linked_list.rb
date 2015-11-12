require 'pry'
require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def each
    node = @head

    while !node.nil?
      yield(node)
      node = node.next_node
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def to_s
    as_string = "LinkedList("
    self.each do |node|
      as_string += "#{node.info}, "
    end
    as_string.chop!.chop! if as_string.end_with?(", ")
    as_string += ")"
  end

  def [](index)
    @node = @head
    index.times do
      @node = @node.next_node
      return nil if @node.nil?
    end
    @node
  end
end
