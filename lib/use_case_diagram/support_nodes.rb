class IntegerLiteral < Treetop::Runtime::SyntaxNode
end

class StringLiteral < Treetop::Runtime::SyntaxNode
end

class EmptyLine < Treetop::Runtime::SyntaxNode
  def obj
    nil
  end
end
class CommentLine < Treetop::Runtime::SyntaxNode
  
  def obj
    nil
  end
end

class NewLine < Treetop::Runtime::SyntaxNode
  def obj
    nil
  end
end

class Identifier < Treetop::Runtime::SyntaxNode
  def obj
    nil
  end
end

class Expression < Treetop::Runtime::SyntaxNode
end
