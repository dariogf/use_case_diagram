class Node
  
  attr_accessor :name,:description
  
  
  #-----------------------------------------
  # 
  #-----------------------------------------
  def initialize(name)
    @name=name.to_s
    if !@name.nil?
      @description=@name.gsub('_','\n')
    end
    
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
  
  def find(name)
    # puts "="*20
    # puts "FIND #{name},#{name.class}, count:#{@nodes.count}:"
    # res=nil
    # @nodes.each do |n|
    #    puts "- #{n.name}"
    #    if n.name.to_sym==name
    #     res=n
    #     puts "*** FOUND #{res.name}."
    #     
    #     break
    #   end
    # end
    #     
    res=@nodes.find{|e| e.name.to_sym==name}
    return res
  end
  
  def to_dot
     res=NODES_TPL
     @nodes.each do |node|
       desc=''
       if !node.description.nil?
         desc=' [label="'+node.description+'"]'
       end
       res=res.gsub('#NODE#',node.name.dquote+"#{desc};\n#NODE#")
     end
     
     res=res.gsub('#NODE#',"")
     
     return res
  end
  
end
