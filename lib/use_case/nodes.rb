class Node
  
  attr_accessor :name,:description
  
  
  #-----------------------------------------
  # 
  #-----------------------------------------
  def initialize(name)
    @name=name.to_s
    @description=nil
  end  
  
end

NODES_TPL = <<END
    /* Use Case Nodes */

    node [shape=ellipse, style=solid];
    
    #NODE#
    
END


class Nodes
          
  def initialize
    @nodes=[]
  end
  
  def count
    @nodes.count
  end
  
  
  def add(name) 

    n=name
    if !n.is_a?(Node)
        n=Node.new(name)
    end
    @nodes<<n
    
      
  end
  
  def to_dot
     res=NODES_TPL
     @nodes.each do |node|
       desc=''
       if !node.description.nil?
         desc=' [label="'+node.description+'"]'
       end
       res=res.gsub('#NODE#',node.name+"#{desc};\n#NODE#")
     end
     
     res=res.gsub('#NODE#',"")
     
     return res
  end
  
end
