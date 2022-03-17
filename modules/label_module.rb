require_relative '../classes/lable'
require 'json'
require 'date'

module LabelsDataController
  def load_labels
    file = './json/labels.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Label.new(title: element['title'], color: element['color']))
      end
    end
    data
  end

  def save_labels
    data = []
    @labels.each do |label|
      data.push({ title: label.title, color: label.color })
    end
    File.write('./json/labels.json', JSON.generate(data))
  end
end
