require_relative 'node'

class LinkedList
  attr_reader :size, :head

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value)
    end
    @size += 1
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current_node = @head
      @head = Node.new(value)
      @head.next_node = current_node
    end

    @size += 1
  end

  def tail
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?

    current_node
  end

  def at(index)
    current_node = @head

    index.times { current_node = current_node.next_node }
    current_node
  end

  def pop
    current_node = @head
    previous_node = nil

    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
  end

  def contains?(value)
    current_node = @head

    @size.times do
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    i = 0

    @size.times do
      return i if current_node.value == value

      current_node = current_node.next_node
      i += 1
    end
    nil
  end

  def to_s
    current_node = @head
    list_string = ''

    @size.times do
      list_string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    list_string += 'nil'
  end

  def insert_at(index, value)
return prepend(value) if index == 0

    prev_node = at(index - 1)
    temp_node = prev_node.next_node

    prev_node.next_node = Node.new(value)
    prev_node.next_node.next_node = temp_node
    @size += 1
  end

  def delete_at(index)
    if index.zero? 
      @head = @head.next_node
      return @size -= 1
    end

    prev_node = at(index - 1)
    prev_node.next_node = prev_node.next_node.next_node
    @size -= 1
  end
end



linked = LinkedList.new
linked.append(5)
linked.append(15)

p "The size: #{linked.size}"
p "Value of the head: #{linked.head.value}"
p "Value of the tail: #{linked.tail.value}"
p "The node at a particular index: #{linked.at(0)}"

p "Value of the last node: #{linked.tail.value}"
p "Does the list contain the value: #{linked.contains?(5)}"
p "The index of the node with a value of: #{linked.find(15)}"
p linked.to_s
linked.prepend(10)
p linked.to_s
linked.insert_at(1, 20)
p linked.to_s
linked.delete_at(0)
p linked.to_s
