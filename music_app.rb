require_relative 'music_album'
require_relative 'genre_music'
require 'date'
require 'json'

class MusicApp
  attr_accessor :music_album, :genre_music

  def initialize
    @music_album = load_data('musicAlbum.json')
    @genre_music = load_data('genreMusic.json')
  end

  def load_data(filename)
    if File.exist?(filename)
      JSON.parse(File.read(filename))
    else
      []
    end
  end

  def save_data(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end

  def list_music_album
    if File.exist?('musicAlbum.json')
        music_data = JSON.parse(File.read('musicAlbum.json'))

    if music_data.empty?
      puts 'No music album available'
    else
        music_data.each_with_index do |music, i|
        puts "Number: #{i + 1}, Publisher: #{music['publisher']}, Cover_state: #{music['cover_state']},
            Publish_date: #{music['publish_date']}, Archived: #{music['archived']}, On_spotify: #{music['on_spotify']}"
      end
    end
    else
        puts 'The musicAlbum file does not exist.'
    end
  end

  def list_music_genre
    if File.exist?('genreMusic.json')
        genre_data = JSON.parse(File.read('genreMusic.json'))

    if genre_data.empty?
      puts 'No genre of music available'
    else
        genre_data.each_with_index do |genre, i|
        puts "Number: #{i + 1}, id: #{genre[id]}, Name: #{genre[name]},
            Items: #{genre[items]}"
      end
    end
    else
        puts 'genreMusic file does not exist'
    end
  end

  def add_music_album
    id = Random.rand(1..1_000)
    puts 'Enter publisher: '
    publisher = gets.chomp
    puts 'Enter cover state: '
    cover_state = gets.chomp
    publish_date = Date.today
    puts 'On spotify? (true/false): '
    on_spotify = gets.chomp

    music = MusicAlbum.new(id, publisher, cover_state, publish_date, on_spotify: on_spotify)
    @music_album << music
    save_data('musicAlbum.json', @music_album)

    puts 'Music album created successfully'
  end
end
