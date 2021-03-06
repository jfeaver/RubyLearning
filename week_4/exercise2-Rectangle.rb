class Rectangle
  def initialize( p1, p2 )
    if p1.class != p2.class
      abort('arguments should have same type')
    end
    
    height, width = case 
    when p1.class == Fixnum || p1.class == Float
      [ p1, p2 ]
    when p1.class == Array
      if !(p1.length == 2 && p2.length == 2)
        warn 'unknown Rectangle definition'
        [ 0, 0 ]
      else
        [ (p1[0]-p2[0]).abs, (p1[1]-p2[1]).abs ]
      end
    else
      warn 'unknown Rectangle definition'
      [ 0, 0 ]
    end
    
    @area = height * width
    @perimeter = 2 * ( height + width )
  end
  
  def area( round_to = false )
    round_to ? self.formatter( @area, round_to ) : @area
  end
  
  def perimeter( round_to = false )
    round_to ? self.formatter( @perimeter, round_to ) : @perimeter
  end
  
  def formatter( num, decimals )
    multiplier = 1
    decimals.times { |i| multiplier *= 10 }
    ((num *= multiplier ).round.to_f)/multiplier
  end
  
end

if __FILE__ == $0
  c1, c2 = [-2], [2,1]
  r = Rectangle.new( c1, c2 )
  puts r.area
  puts r.perimeter
end