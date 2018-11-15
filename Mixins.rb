module Garb
  def  self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods  
  end
  
  module ClassMethods
    attr_reader :last, :all
   
    def arr(obj)
      @animals ||= []
      @animals << obj
    end

    def inc
      @last ||= 0
      @last += 1
    end
  end

  module InstanceMethods
    private
    def inc
      self.class.arr(self)
      self.class.inc
    end
  end  
end

class Dog
  include Garb  
  def initialize
    inc
  end
end

class Persone
  include Garb

  def initialize
    inc
  end
end

s = Persone.new
d = Dog.new
5.times { Dog.new }
p Dog.last
p Persone.last
p Dog.all

puts '======================================'
p s.instance_variables
p Dog.instance_variables
p Dog.class_variables
p Garb.instance_variables
p Garb.class_variables
