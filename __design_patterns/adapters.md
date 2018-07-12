# Design pattern : Adapters

https://github.com/kamranahmedse/design-patterns-for-humans#-adapter

Blog resource: https://www.sitepoint.com/using-and-testing-the-adapter-design-pattern/

## When to use - What it solves

It makes the code more flexible.

## Testing the adapter

De façon la plus simple, tu as une classe Mère et une adapter appelée par la classe mère.

Donc il faut tester, les 2 classes:
 - la classe Mère : il faut tester que le système d'adapter fonctionne comme il faut. Pour cela il serait bien d'avoir une
   classe Null qui simule un adapter de base et qui retourne des données simples à tester.
 - la classe Adapter : on l'appelle avec la classe Mère et on valide que les méthodes de la classe Adapter sont bien appelées.


## Concrete speaking example

i.e. you have an object connecting to the DB. you create an adapter so you can have a :
 - DbAdapter for production
 - TestAdapter for testing

Simple and Flexible ;0)

## Example

```ruby
class Animal
  def speak(kind)
    puts case kind
    when :dog then "woof!"
    when :cat then "meow!"
    when :owl then "hoo!"
    end
  end
end

Animal.new.speak(:dog)
```

This code is nice but what if you want to add a new animal ?
**Solution** => Adapters

```ruby
class Animal
  module Adapter
    module Dog
      def self.speak
        puts "woof!"
      end
    end

    module Cat
      def self.speak
        puts "meow!"
      end
    end
  end

  def speak
    self.adapter.speak
  end

  def adapter
    return @adapter if @adapter
    self.adapter = :dog
    @adapter
  end

  def adapter=(adapter)
    @adapter = Animal::Adapter.const_get(adapter.to_s.capitalize)
  end
end

animal = Animal.new
animal.speak
animal.adapter = :cat
aanimal.speak
```

Like this, we can add new animals easily. By adding a new module:

```ruby
class Animal
  module Adapter
    module Owl
      def self.speak
        puts "hoo!"
      end
    end
  end
end

animal.adapter = :owl
animal.speak
```


# Simple class expecting adapters

```ruby
# lib/table_parser.rb

module TableParser

  def parse(text)
    self.adapter.parse(text)
  end

  def adapter
    return @adapter if @adapter
    self.adapter = :split
    @adapter
  end

  def adapter=(adapter)
    require "table_parser/adapters/#{adapter}"
    @adapter = TableParser::Adapter.const_get(adapter.to_s.capitalize)
  end
end
```





