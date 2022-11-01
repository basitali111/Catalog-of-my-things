require './item'

class MusicAlbum < Item
  attr_accessor :on_sportify

  def initialize(publish_date, on_sportify)
    super(publish_date)
    @on_sportify = on_sportify
  end

  def can_be_archived?
    super && @on_sportify
  end
end
