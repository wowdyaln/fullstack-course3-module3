class Point
  attr_accessor :longitude, :latitude

  def initialize(lon, lat)
    @longitude = lon
    @latitude = lat
  end

  def mongoize
    {
      type:"Point", coordinates:[@longitude, @latitude]
    }
  end

  def self.demongoize(object)
    Point.new(object[:coordinates][0], object[:coordinates][1])
  end



end
