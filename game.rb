require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, publish_date, archived, multiplayer, last_played_at)
    super(id, publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && last_played_at <= Date.today - (2 * 365) # Archiving games after 2 years of inactivity
  end
end
