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

  def length
    node_count = 0
    self.each { |node| node_count += 1 }
    node_count
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

  def insert(index, value)
    if index == 0
      self.prepend(value)
    elsif index == (self.length)
      self[self.length - 1].next_node = Node.new(value)
    else
      @previous_node = self[index - 1]
      @next_node = self[index]
      @previous_node.next_node = Node.new(value, @next_node)
    end
  end

  def remove(index)
    if self[index] == @head
      @head = self[1]
    else
      @previous_node = self[index - 1]
      @next_node = self[index + 1]
      @previous_node.next_node = @next_node
    end
  end
end
