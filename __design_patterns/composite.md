# Composite

## Tl;dr

 - The key concept is that you can manipulate a single instance of the object just as you would manipulate a group of them.

## Resources

- https://github.com/kamranahmedse/design-patterns-for-humans#-composite
- Source: https://en.wikipedia.org/wiki/Composite_pattern

## What problems can the Composite design pattern solve?

 - The key concept is that you can manipulate a single instance of the object just as you would manipulate a group of them.

 - If programmers find that they are using multiple objects in the same way, and often have nearly identical code to handle each of them,
    then composite is a good choice; it is less complex in this situation to treat primitives and composites as homogeneous.

In the following example, we clearly see that we are building a tree structure where `Ellipses` are leafes and `Composite` objects are branches.

 ```ruby
class Graphic
  def print
    raise "not implemented"
  end
end

# Composite
class CompositeGraphic < Graphic

  def initialize
    @graphics = []
  end

  def print
    @graphics.each do |graphic|
      graphic.print
    end
  end

  def add(graphic)
    @graphics.push(graphic)
  end

  def remove(graphic)
    @graphics.delete(graphic)
  end
end

# Leaf
class Ellipse < Graphic

  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def print
    puts "Ellipse #{self.name}"
  end
end


class Program
  def initialize
    ellipse1 = Ellipse.new("1")
    ellipse2 = Ellipse.new("2")
    ellipse3 = Ellipse.new("3")
    ellipse4 = Ellipse.new("4")

    graphic = CompositeGraphic.new
    graphic1 = CompositeGraphic.new
    graphic2 = CompositeGraphic.new

    # graphic 1 contains 3 ellipses
    graphic1.add(ellipse1)
    graphic1.add(ellipse2)
    graphic1.add(ellipse3)

    # graphic 2 contains 1 ellipse
    graphic2.add(ellipse4)

    # graphic contains both graphic 1 and graphic 2
    graphic.add(graphic1)
    graphic.add(graphic2)

    # now print the graphic
    graphic.print
  end
end

Program.new
```
