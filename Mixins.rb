module Garb
  def  self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods  
  end
  
  module ClassMethods
    attr_reader :count, :all
    
    def arr(object)
      @all ||= []
      @all << object
    end

    def increment
      @count ||= 0
      @count += 1
    end
  end

  module InstanceMethods
    private
    def increment(obj)
      self.class.arr(obj)
      self.class.increment
    end
  end  
end

class Dog
  include Garb  
  def initialize
    increment(self)
  end
end

class Persone
  include Garb
  def initialize
    increment(self)
  end
end

s = Persone.new
d = Dog.new
5.times { Dog.new }
p Dog.count
p Persone.count
p Dog.all

puts '======================================'
p s.instance_variables
p Dog.instance_variables
p Dog.class_variables
p Garb.instance_variables
p Garb.class_variables
