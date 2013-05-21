require File.dirname(__FILE__) + '/../../test_helper.rb'


class TestUseCase < Test::Unit::TestCase

  @@base_path=File.dirname(__FILE__)

  def test_parse_empty
    res=Parser.parse("")

    assert(res.obj.is_a?(Diagram))
    
    assert_equal(res.obj.actors.count,0)
    assert_equal(res.obj.nodes.count,0)
    # assert_equal(res.obj.uses.count,0)
    # assert_equal(res.obj.includes.count,0)
    # assert_equal(res.obj.extends.count,0)
        
  end

  def test_parse_actor
    res=Parser.parse("actor :dario\n")

    assert(res.obj.is_a?(Diagram))
    
    assert_equal(res.obj.actors.count,1)
    assert_equal(res.obj.nodes.count,0)
        
  end
  
  def test_parse_node
    res=Parser.parse("node :login\n")

    assert(res.obj.is_a?(Diagram))
    
    assert_equal(res.obj.actors.count,0)
    assert_equal(res.obj.nodes.count,1)
        
  end
  
  def test_parse
    res=Parser.parse("actor :dario\n node :login \n node :logout\n")

    assert(res.obj.is_a?(Diagram))
    
    assert_equal(res.obj.actors.count,1)
    assert_equal(res.obj.nodes.count,2)
        
  end

  def test_uses
    cont=File.read(File.join(@@base_path,'ej1.txt'))
    res=Parser.parse(cont)

    assert(res.obj.is_a?(Diagram))
    
    assert_equal(res.obj.actors.count,2)
    assert_equal(res.obj.nodes.count,4)

  end
  
  
  
end