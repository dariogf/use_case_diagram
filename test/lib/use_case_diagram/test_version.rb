require File.dirname(__FILE__) + '/../../test_helper.rb'


class TestUseCase < Test::Unit::TestCase

  @@base_path=File.dirname(__FILE__)

  def test_parse_empty
    res=Parser.parse("")

    assert(res.is_a?(Diagram))
    
    assert_equal(res.actors.count,0)
    assert_equal(res.nodes.count,0)
    # assert_equal(res.uses.count,0)
    # assert_equal(res.includes.count,0)
    # assert_equal(res.extends.count,0)
        
  end

  def test_parse_actor
    res=Parser.parse("actor :dario\n")

    assert(res.is_a?(Diagram))
    
    assert_equal(res.actors.count,1)
    assert_equal(res.nodes.count,0)
        
  end
  
  def test_parse_node
    res=Parser.parse("node :login\n")

    assert(res.is_a?(Diagram))
    
    assert_equal(res.actors.count,0)
    assert_equal(res.nodes.count,1)
        
  end
  
  def test_parse
    res=Parser.parse("actor :dario\n node :login \n node :logout\n")

    assert(res.is_a?(Diagram))
    
    assert_equal(res.actors.count,1)
    assert_equal(res.nodes.count,2)
        
  end

  def test_uses
    cont=File.read(File.join(@@base_path,'ej1.txt'))
    res=Parser.parse(cont)
    
    assert(res.is_a?(Diagram))
       
    assert_equal(res.actors.count,2)
    assert_equal(res.nodes.count,9)
    
    puts res.to_dot
      
  end
  
  
  
end