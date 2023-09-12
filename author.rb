class Author
  attr_reader :published_items, :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @published_items = []
  end

  def publish_item(item)
    item.author = self
    @published_items << item
  end
end
