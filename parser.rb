module MenuSolver
	class MenuParser

		def initialize(file)
			@file = File.open(file)
		end

		def parse
			menu_hash = Hash.new
			menu_hash[:dishes] = []
			@file.readlines.each_with_index do |line, idx|
				if idx == 0
					menu_hash[:target] = line.gsub(/[^\d\.]/, '').to_f
				else
					arr = line.split(',')
					menu_hash[:dishes] << ({name: arr[0], price: arr[1].gsub(/[^\d\.]/, '').to_f})
				end
			end
			Solver.new(menu_hash)
		end
	end

	class Solver 

		def initialize(menu_hash)
			@dishes = menu_hash[:dishes]
			@target = menu_hash[:target]
			@solutions = []
		end
		
		def solve(initial = 0, solution = [])
			@dishes.each do |dish| 
				current = initial + dish[:price]
				current_combo = solution + [dish[:name]]
				if current == @target 
				 @solutions << current_combo
				 elsif current < @target
					solve(current, current_combo)
				end
			end
			@results = @solutions.collect{|combos| combos.sort}.uniq
		end
	end
end
