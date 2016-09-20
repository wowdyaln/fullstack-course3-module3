class Point
  attr_accessor :longitude, :latitude

  def initialize(lon, lat)
    @longitude = lon
    @latitude = lat
  end

# 轉換一個物件 成為 mongoDB 資料庫形式
  def mongoize
    {
      type:"Point", coordinates:[@longitude, @latitude]
    }
  end

# 把某個物件的座標當做參數，再 new 一個新物件出來
  def self.demongoize(object)
    Point.new(object[:coordinates][0], object[:coordinates][1])
  end


  def self.mongoize(object)
    case object
    when Point then object.mongoize
    when Hash then
      if object[:type]
        Point.new(object[:coordinates][0], object[:coordinates][1]).mongoize
      else
        Point.new(object[:longitude], object[:latitude]).mongoize
      end
    else object
    end
  end

  def self.evolve(object)
    case object
    when Point then object.mongoize
    else
      object
    end
  end

end
