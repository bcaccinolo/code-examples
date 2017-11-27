# Design pattern : Factory

Blog resource: https://practicingruby.com/articles/creational-design-patterns

## When to use - What it solves

### Create a better interface to create the object

It's usefull when the instantiation of the object is difficult and heavy.
Thinking about the factory design often means creating a dedicated Factory Object.
In fact, it's not mandatory. We can just add some class methods in charge of the
instantiation but offering a cleander interface to create the object.


# Ruby

## The problem

```ruby
class AdjacencyMatrix
  def initialize(data, directed=false)
    #...
  end
end

undirected_matrix = AdjacencyMatrix.new(data)
directed_matrix   = AdjacencyMatrix.new(data, true)
```

We can see here the addition of the 2nd argument is not really clear about what it means.
Let's create a better interface with 2 simple class methods that will simplify the instantiation.

## The solution

```ruby
class AdjacencyMatrix

  # The Mini Factory
  class << self
    def undirected(data)
      new(data)
    end

    def directed(data)
      new(data,true)
    end

    private :new # << new method is now private
  end

  def initialize(data, directed=false)
    #...
  end
end

undirected_matrix = AdjacencyMatrix.undirected(data)
directed_matrix   = AdjacencyMatrix.directed(data)
```

A better way to create objects wih a clearer interface.
