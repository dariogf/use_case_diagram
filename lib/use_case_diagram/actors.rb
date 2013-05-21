actor_path=File.join(File.dirname(File.dirname(__FILE__)),'use_case_diagram','Actor.png')


ACTOR_TPL =<<END                                                           

#NAME# [shapefile="#{actor_path}", peripheries=0, style=solid, fixedsize=true, height=1.1, labeldistance=100, labelloc="b" #LABEL#];

END

class Actor
  
  attr_accessor :name, :description
  
  #-----------------------------------------
  # 
  #-----------------------------------------
  def initialize(name)
    @name=name.to_s
    @description=nil
    
  end  
  
  def to_dot
       res=ACTOR_TPL
       res=res.gsub('#NAME#',@name)
       lab=''
       if !@description.nil?
         lab=' , label="'+@description.to_s+'"'
       end
       res=res.gsub('#LABEL#',lab)
       return res
    
  end
  
end

ACTORS_TPL = <<END
    /* Actor Nodes */

      #ACTOR#

END


class Actors
      
  def initialize
    @actors=[]
  end
               
  def count
    @actors.count
  end
  
  def add(name)
      a=name
      if !a.is_a?(Actor)
          a=Actor.new(name)
      end
      
      @actors<<a
  end
  
  def to_dot
     res=ACTORS_TPL
     @actors.each do |actor|
       res=res.gsub('#ACTOR#',actor.to_dot+"\n#ACTOR#")
      
     end
     res=res.gsub('#ACTOR#',"")
     
     return res
  end
  
end
