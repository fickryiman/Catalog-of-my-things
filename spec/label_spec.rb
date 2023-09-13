require 'json'
require 'date'
require_relative '../item'
require_relative '../label'

describe Label do
  describe '-> Initialize Label class (.new)' do
    let(:id) { 1 }
    let(:title) { 'Label Title' }
    let(:color) { 'Label Color' }
    let(:label) { Label.new(id, title, color) }

    it 'should assign the correct instance variables attributes' do
      expect(label.id).to eq(id)
      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
      expect(label.items).to eq([])
    end
  end

  describe '-> Method .convert_to_hash' do
    let(:id) { 1 }
    let(:title) { 'Label Title' }
    let(:color) { 'Label Color' }
    let(:label) { Label.new(id, title, color) }
    let(:expected_hash) { { 'id' => id, 'title' => title, 'color' => color } }

    it 'returns a hash representation of the label' do
      expect(label.convert_to_hash).to eq(expected_hash)
    end
  end

  describe '-> Method .load_label' do
    context 'when labels.json exist and is not empty' do
      let(:label_data) { [{ 'id' => 1, 'title' => 'Label Title', 'color' => 'Label Color'}]}

      before do
        allow(File).to receive(:exist?).with('labels.json').and_return(true)
        allow(File).to receive(:empty?).with('labels.json').and_return(false)
        allow(File).to receive(:read).with('labels.json').and_return(label_data.to_json)
      end

      it 'return Label Instances array' do
        labels = Label.load_labels

        expect(labels).to be_an(Array)
        expect(labels.length).to eq(1)
        expect(labels.first).to be_an_instance_of(Label)
        expect(labels.first.id).to eq(1)
        expect(labels.first.title).to eq('Label Title')
        expect(labels.first.color).to eq('Label Color')
      end
    end

    context 'when labels.json file not exist or is empty' do
      before do
        allow(File).to receive(:exist?).with('labels.json').and_return(false)
        allow(File).to receive(:empty?).with('labels.json').and_return(true)
      end

      it 'returns an empty array' do
        labels = Label.load_labels

        expect(labels).to eq([])
      end
    end
  end
end