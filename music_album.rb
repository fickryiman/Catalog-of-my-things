require_relative 'item'

class MusicAlbum < Item
    attr_accessor :publisher, :cover_state
    attr_reader :id, :on_spotify
  
    def initialize(id, publisher, cover_state, publish_date, on_spotify: false)
      super(id, publish_date, false)
      @publisher = publisher
      @cover_state = cover_state
      @on_spotify = on_spotify
    end
  
    def can_be_archived?
      super && @on_spotify == true
    end
  end
