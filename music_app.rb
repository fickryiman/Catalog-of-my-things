require_relative 'music_album'
require_relative 'genre_music'
require 'date'

class MusicApp 
    attr_accessor :music_album, :genre_music

    def initialize
        @music_album = []
        @genre_music = []
    end

    def list_music_album
        if @music_album.empty?
          puts 'No music album available'
        else
          @music_album.each_with_index do |music, i|
            puts "Number: #{i + 1}, publisher: #{music.publisher}, cover_state: #{music.cover_state}, 
            publish_date: #{music.publish_date}, archived: #{music.archived}, on_spotify: #{music.on_spotify}"
          end
        end
      end

      def list_genre
        if @genre_music.empty?
          puts 'No genre of music available'
        else
          @genre_music.each_with_index do |genre, i|
            puts "Number: #{i + 1}, id: #{genre.id}, name: #{genre.name}, 
            items: #{genre.items}"
          end
        end
      end

      def add_music_album(id, publisher, cover_state, publish_date, on_spotify: false)
        id = Random.rand(1..1_000)
        puts 'Enter publisher: '
        publisher = gets.chomp
        puts 'Enter cover state: '
        cover_state = gets.chomp
        publish_date = Date.today
        puts 'On spotify? (true/false): '
        on_spotify = gets.chomp

        music = MusicAlbum.new(id, publisher, cover_state, publish_date, on_spotify)
        @music_album << music
        
        puts 'Music album created successfully'
    end
end
