require_relative "parser"

file = MenuSolver::Parser.new ARGV[0] || 'menu.txt'

results = file.parse.solve 

if results == []
	p "No combo will match target price!"
	
else
	results.each do |result| 
		p result
	end
end
