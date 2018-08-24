# Mixin in Ruby

## Tl;dr

Check the examples

## Resources

- https://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html

## Simple example

```ruby
module Debug
  def whoAmI?
    "#{self.type.name} (\##{self.id}): #{self.to_s}"
  end
end
class Phonograph
  include Debug
  # ...
end
class EightTrack
  include Debug
  # ...
end
ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")
ph.whoAmI?	»	"Phonograph (#537766170): West End Blues"
et.whoAmI?	»	"EightTrack (#537765860): Surrealistic Pillow"
```

## Example wih class methods

- `:include` to add instance methods
- `:extend` to add class methods
All this done with the module method `self.included`.

```ruby
class MyClass
  include A
end

module A
  def self.included base
    base.send :include, InstanceMethods
    base.send :extend, ClassMethods
  end

  module InstanceMethods
    def my_instance_method
      "module A instance method"
    end
  end

  module ClassMethods
    def my_class_method
      "module B class method"
    end
  end
end
```
