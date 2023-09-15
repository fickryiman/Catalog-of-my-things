require_relative 'item'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, publish_date, archived, multiplayer, last_played_at)
    super(id, publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    today = Date.today
    inactive_days = (today - last_played_at).to_i

    puts "Today: #{today}"
    puts "Last Played At: #{last_played_at}"
    puts "Inactive Days: #{inactive_days}"

    result = archived || inactive_days > (2 * 365) # Archiving games after 2 years of inactivity
    puts "Result: #{result}"

    result
  end

  def to_json(option = {})
    {
      id: @id,
      publish_date: @publish_date.to_s, # Convert Date to a string
      archived: @archived,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at.to_s # Convert Date to a string
    }.to_json(option)
  end
end
