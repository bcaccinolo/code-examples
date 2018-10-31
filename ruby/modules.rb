#
# Short recap to understand how you can include methods in class with modules
#

# module do be inserted
module ToInsert
  # To include a class method in the class including this module
  def self.included(base)
    base.class_eval do
      def self.bar
        puts "bar!"
      end
    end
  end

  # Instance method for the class including the module
  def doo
    puts "doo!"
  end

  # This a class method but ToInsert is not a class, it's a module.
  # But it works like a class.
  #
  # Example:
  # ToInsert.foo => bar!
  #
  def self.foo
    puts "bar!"
  end
end

class A
  include ToInsert
end

a = A.new

a.doo
> doo!

a.foo
> NoMethodError: undefined method `foo' for #<A:0x00007fe9aa914560>
