# $: << File.dirname(__FILE__)
$: << File.join(File.dirname(__FILE__),File.basename(__FILE__,File.extname(__FILE__)))		

require "use_case/version"
require "use_case/diagram"
require "use_case/parser"

module UseCase
  # Your code goes here...
end
