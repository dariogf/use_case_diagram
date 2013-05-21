require 'treetop'
require 'use_case'
require 'support_nodes'

# Find out what our base path is
base_path = File.expand_path(File.dirname(__FILE__))

# Load our custom syntax node classes so the parser can use them
# require File.join(base_path, 'node_extensions.rb')

class Parser
  
  base_path = File.expand_path(File.dirname(__FILE__))
                                                      
  Treetop.load(File.join(base_path, 'use_cases'))

  # puts "- Grammar loaded"
  @@parser = UCaseParser.new
  
  # puts "- Parser created loaded"
                               
  def self.parse(data)
    
    # Pass the data to the parser instance
    tree = @@parser.parse(data)
    # puts "- Data parsed"
    
    # If tree is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    if(tree.nil?)
      puts @@parser.failure_reason
      puts @@parser.failure_line
      puts @@parser.failure_column
      
      puts "LINE WITH ERROR:#{data.split("\n")[@@parser.failure_line]}"
      
      raise Exception, "Parse error at offset: #{@@parser.index}"
    end
    
    return tree
  end

end