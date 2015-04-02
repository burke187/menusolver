module MenuSolver
	class MenuParser

		def initialize(file)
			@file = File.open(file)
		end

		def parse
			menu_hash = Hash.new
			menu_hash[:dishes] = [] # All menu items belong to dishes
			@file.readlines.each_with_index do |line, idx|
				if idx == 0
					menu_hash[:target] = line.gsub(/[^\d\.]/, '').to_f # First line of txt file is target price
				else
					arr = line.split(',')
					menu_hash[:dishes] << ({name: arr[0], price: arr[1].gsub(/[^\d\.]/, '').to_f}) # Parse menu items and convert prices to floats for later calcuations
				end
			end
			Solver.new(menu_hash) # Instantiate Solver to define variables
		end
	end

	class Solver 

		def initialize(menu_hash)
			@dishes = menu_hash[:dishes]
			@target = menu_hash[:target]
			@solutions = []
		end
		
		def solve(initial = 0, solution = []) # Solve recursively 
			@dishes.each do |dish| 
				current = initial + dish[:price]
				current_combo = solution + [dish[:name]] 
				if current == @target 
				 @solutions << current_combo
				 elsif current < @target 
					solve(current, current_combo) # Keep the loop going it the target price isn't reached
				end
			end
			@results = @solutions.collect{|combos| combos.sort}.uniq # Filter out duplicates as result of recursion
		end
	end
end
