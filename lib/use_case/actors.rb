ACTOR_TPL =<<END                                                           

/*subgraph clus#NAME# {label="#NAME#";  labelloc="b"; peripheries=0; #NAME#};*/
#NAME# [shapefile="Actor.png", peripheries=0, style=solid, fixedsize=true, height=1.1, labeldistance=100, labelloc="b"];

END

class Actor
  
  attr_accessor :name
  
  #-----------------------------------------
  # 
  #-----------------------------------------
  def initialize(name)
    @name=name.to_s
  end  
  
  def to_dot
       res=ACTOR_TPL
       res=res.gsub('#NAME#',@name)
  
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
