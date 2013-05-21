# $: << File.dirname(__FILE__)
$: << File.join(File.dirname(__FILE__),File.basename(__FILE__,File.extname(__FILE__)))		

require "use_case_diagram/version"
require "use_case_diagram/diagram"
require "use_case_diagram/parser"

module UseCaseDiagram
  # Your code goes here...
end
