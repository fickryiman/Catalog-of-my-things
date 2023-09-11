require_relative 'item'

class Label
  attr_reader :id, :title, :color, :items

  def initialize(id, title, color)
    @id = id || Random.rand(1..1_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return if items.include?(item)

    @items << item
    item.label = self
  end
end