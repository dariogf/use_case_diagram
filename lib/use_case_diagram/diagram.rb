
DIAG_TPL = <<END
digraph G {
    rankdir=LR;
    labelloc="b";
    peripheries=0;

    #ACTORS#
    
    #NODES#

    edge [arrowhead=none];
        
    #USES#

    edge [arrowhead=none, arrowtail=open, label="<<extend>>", style=dashed, dir=both];
    
    #EXTENDS#

    edge [arrowhead=open, arrowtail=none, label="<<includes>>", style=dashed, dir=both];
    
    #INCLUDES#
    
    
    
//    #GENERALISES#
    
}
END

require 'actors.rb'
require 'nodes.rb'
require 'cu_relations'

class Diagram
  
  attr_accessor :actors,:nodes
   
  def initialize(file=nil)
    @file=file
    @actors=Actors.new
    @nodes=Nodes.new
    @uses={}
    @extends={}
    @includes={}
    @generalises={}
    
  end
  
  def inspect
    puts "Actors:#{@actors.count}"
    puts "Nodes:#{@nodes.count}"
    puts "Uses:#{@uses.count}"
    puts "Includes:#{@includes.count}"
    puts "Extends:#{@extends.count}"
    
  end
  
  def relate(relation,from_u,to_u)
    if relation[from_u].nil?
      relation[from_u]=[]
    end
    
    relation[from_u] << to_u
    
  end
  
  def uses(from_u,to_u)
    relate(@uses,from_u,to_u)
  end
  
  def extends(from_u,to_u)
    relate(@extends,from_u,to_u)
  end

  def includes(from_u,to_u)
    relate(@includes,from_u,to_u)
  end

  def generalises(from_u,to_u)
    relate(@generalises,from_u,to_u)
  end


  
  def relations_to_dot(relations)
     res=''
     relations.each do |from_use,to_use|
       to_use.each do |to_u|
        res += "#{from_use} -> #{to_u};\n"        
       end
     end
     
     return res
  end
  
  def uses_to_dot
    return relations_to_dot(@uses)
  end

  def extends_to_dot
    return relations_to_dot(@extends)
  end
  
  
  def includes_to_dot
    return relations_to_dot(@includes)
  end

  def generalises_to_dot
    return relations_to_dot(@generalises)
  end

  
  def to_dot
    res=DIAG_TPL;
    
    res=res.gsub('#ACTORS#',@actors.to_dot)
    res=res.gsub('#NODES#',@nodes.to_dot)
    res=res.gsub('#USES#',uses_to_dot)

    res=res.gsub('#EXTENDS#',extends_to_dot)
    res=res.gsub('#INCLUDES#',includes_to_dot)
    res=res.gsub('#GENERALISES#',generalises_to_dot)

    return res
  end
  
end