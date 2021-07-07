module Concerns::Findable
  def find_by_name(name)
     self.all.find {|a| a.name == name}
   end
   
    def find_or_create_by_name(name)
     found_name = self.find_by_name(name)
       if found_name == nil 
         self.create(name)
      else 
        found_name
       end
     end
   
end