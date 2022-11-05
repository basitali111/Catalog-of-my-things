require './item'
class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'color' => @color
    }
  end
end
