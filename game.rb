require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private :can_be_archived?

  def can_be_archived?
    super && (DateTime.now.strftime('%Y').to_i - last_played_at[6..10].to_i) > 2
  end

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'multiplayer' => @multiplayer,
      'author' => @author,
      'publication_date' => @publish_date,
      'last_played_at' => @last_played_at
    }
  end
end
