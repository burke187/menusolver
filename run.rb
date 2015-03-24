require_relative "parser"

file = MenuSolver::MenuParser.new ARGV[0] || 'menu.txt'

results = file.parse.solve 

results.each do |result| 
			p result
end

