module Memorable
  module ClassMethods
    def self.destroy_all
      self.all.clear
    end 
  end 
  
  module InstanceMethods
    
  end
end 