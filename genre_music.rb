require 'json'

class GenreMusic
  attr_accessor :items, :name
  attr_reader :id

  def initialize(id, name, items)
    @id = id
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
    # item.genre = self
  end

  def to_json(option = {})
    {
      id: @id,
      name: @name,
      items: @items
    }.to_json(option)
  end
end
