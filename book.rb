require_relative 'item'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date
  attr_reader :id

  def initialize(id, publisher, cover_state, publish_date, label)
    super(id, publish_date, false)
    @id = id || Random.rand(1..1_000)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @label = label
    @archived = can_be_archived?
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
