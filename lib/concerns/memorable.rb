module Concerns::Memorable
  module ClassMethods
    def destroy_all
      self.all.clear
    end 
    
    def create(new_name)
      instance = self.new(new_name)
      instance.save
      instance
    end
  end 
  
  module InstanceMethods
    def save 
      self.class.all << self
    end 
  end
end 