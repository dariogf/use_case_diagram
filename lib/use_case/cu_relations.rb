
class Relation
  
  attr_accessor :from_u, :to_u, :type
  
  #-----------------------------------------
  # 
  #-----------------------------------------
  def initialize(type, from_u, to_u)
    @from_u=from_u
    @to_u=to_u
    @type=type
  end  
  
end
