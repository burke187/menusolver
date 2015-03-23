require_relative "parser"

file = MenuSolver::MenuParser.new ARGV[0] || 'menu.txt'

puts file.parse.solve.inspect