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
    add_items_to_json_file(item)
  end

  def add_items_to_json_file(items)
    item_loader = load_item
    item_loader << items

    json_item = item_loader.map do |item|
      {
        'id' => item.id,
        'publish_date' => item.publish_date,
        'archived' => item.archived,
        'label' => if item.label.is_a?(Hash)
                     item.label
                   else
                     {
                       'id' => item.label.id,
                       'title' => item.label.title,
                       'color' => item.label.color
                     }
                   end

      }
    end
    File.write('items.json', JSON.generate(json_item))
  end

  def self.list_all_labels
    puts 'All Books Labels Listed: '
    labels = JSON.parse(File.read('labels.json'), symbolize_names: true)
    labels.each do |label|
      puts "id: #{label[:id]}, Title: #{label[:title]}, Color: #{label[:color]}"
    end
  end

  def convert_to_hash
    {
      'id' => id,
      'title' => title,
      'color' => color
    }
  end

  def save_labels_to_json_file(labels)
    json_label = labels.map do |label|
      {
        'id' => label.id,
        'title' => label.title,
        'color' => label.color
      }
    end
    File.write('labels.json', JSON.generate(json_label))
  end

  def self.load_labels
    return [] unless File.exist?('labels.json') && !File.empty?('labels.json')

    labels = JSON.parse(File.read('labels.json'))
    labels.map do |label|
      Label.new(label['id'], label['title'], label['color'])
    end
  end

  def load_item
    return [] unless File.exist?('items.json') && !File.empty?('items.json')

    items = JSON.parse(File.read('items.json'))
    items.map do |data|
      item = Item.new(data['id'], data['publish_date'], data['archived'])
      item.label = data['label']
      item
    end
  end
end
